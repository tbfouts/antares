#!/bin/bash
set -e

echo "=== Qt Boot to Qt Build Script ==="
echo "Build started at: $(date)"

# System dependencies and GitHub CLI are pre-installed in ECR container
echo "Using pre-built environment with all dependencies..."

# Install GitHub CLI (only component not in ECR)
echo "Installing GitHub CLI..."
curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | tee /etc/apt/sources.list.d/github-cli.list > /dev/null
apt-get update
apt-get install -y gh

# Qt is pre-installed in ECR container - no installation needed
echo "Using pre-built Qt 6.8.3 from ECR container..."
echo "Qt installation:"
ls -la /opt/Qt/6.8.3/

# Set up Boot to Qt environment  
echo "Setting up Boot to Qt environment..."
export QT_DIR=/opt/Qt/6.8.3
export BOOT2QT_DIR=$QT_DIR/Boot2Qt

# Find and fix toolchain environment setup script
TOOLCHAIN_ENV_SCRIPT=$(find $BOOT2QT_DIR -name "environment-setup-*" -type f | head -1)
if [ -f "$TOOLCHAIN_ENV_SCRIPT" ]; then
  echo "Found toolchain environment script: $TOOLCHAIN_ENV_SCRIPT"
  
  # Fix hardcoded paths in toolchain script
  sed -i 's|/usr/local/oe-sdk-hardcoded-buildpath/sysroots|/opt/Qt/6.8.3/Boot2Qt/aws-ec2-arm64/toolchain/sysroots|g' "$TOOLCHAIN_ENV_SCRIPT"
  
  # Fix hardcoded paths in CMake toolchain file
  CMAKE_TOOLCHAIN_FILE="$BOOT2QT_DIR/aws-ec2-arm64/toolchain/sysroots/x86_64-pokysdk-linux/usr/share/cmake/OEToolchainConfig.cmake"
  if [ -f "$CMAKE_TOOLCHAIN_FILE" ]; then
    sed -i 's|/usr/local/oe-sdk-hardcoded-buildpath/sysroots|/opt/Qt/6.8.3/Boot2Qt/aws-ec2-arm64/toolchain/sysroots|g' "$CMAKE_TOOLCHAIN_FILE"
  fi
  
  # Fix hardcoded paths in all relevant files
  find "$BOOT2QT_DIR/aws-ec2-arm64/toolchain" -type f \( -name "*.cmake" -o -name "*.pc" -o -name "*.la" -o -name "*.conf" -o -name "*.prf" \) -exec sed -i 's|/usr/local/oe-sdk-hardcoded-buildpath/sysroots|/opt/Qt/6.8.3/Boot2Qt/aws-ec2-arm64/toolchain/sysroots|g' {} \; 2>/dev/null || true
  
  source "$TOOLCHAIN_ENV_SCRIPT"
  export OECORE_CMAKE_TOOLCHAIN_FILE="$CMAKE_TOOLCHAIN_FILE"
  
  echo "Building Cluster Application for Boot to Qt (includes common library automatically)..."
  cd $CODEBUILD_SRC_DIR/Cluster
  mkdir build-boot2qt && cd build-boot2qt
  
  # Use 6 parallel jobs for BUILD_GENERAL1_LARGE (8 vCPUs, 15GB memory)
  JOBS=6
  echo "Using $JOBS parallel jobs for compilation"
  
  cmake .. \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_TOOLCHAIN_FILE=$OECORE_CMAKE_TOOLCHAIN_FILE \
    -DQt6_DIR=$OECORE_TARGET_SYSROOT/usr/lib/cmake/Qt6 \
    -DQT_HOST_PATH=/opt/Qt/6.8.3/gcc_64
  cmake --build . --parallel $JOBS
  
  # Copy artifacts
  echo "Copying build artifacts..."
  mkdir -p $CODEBUILD_SRC_DIR/artifacts/aws
  if [ -f "ClusterApp" ]; then
    cp ClusterApp $CODEBUILD_SRC_DIR/artifacts/aws/
    echo "ClusterApp copied to artifacts"
  else
    echo "ClusterApp not found"
    exit 1
  fi
  
  # Create deployment script
  cat > $CODEBUILD_SRC_DIR/artifacts/aws/deploy.sh << 'EOF'
#!/bin/bash
# Boot to Qt AWS deployment script

# Set up environment
export QT_QPA_PLATFORM=eglfs
export QT_QPA_EGLFS_INTEGRATION=eglfs_kms

# Run the Cluster application
./ClusterApp
EOF
  chmod +x $CODEBUILD_SRC_DIR/artifacts/aws/deploy.sh
  
  # Create build info file
  cat > $CODEBUILD_SRC_DIR/artifacts/aws/build_info.txt << EOF
Boot to Qt Build
================
Build Date: $(date)
Qt Version: 6.8.3
Platform: Boot to Qt AWS EC2 ARM64
Architecture: aarch64
Application: Cluster
CodeBuild Project: $CODEBUILD_PROJECT_NAME
Build ID: $CODEBUILD_BUILD_ID
Source Version: $CODEBUILD_RESOLVED_SOURCE_VERSION
Triggered by: GitHub Actions
EOF
  
  echo "Creating GitHub release..."
  cd $CODEBUILD_SRC_DIR/artifacts/aws
  tar -czf ../antares-cluster-boot2qt-${CODEBUILD_BUILD_NUMBER}.tar.gz *
  cd $CODEBUILD_SRC_DIR
  
  # Retrieve GitHub token from Parameter Store
  GITHUB_TOKEN=$(aws ssm get-parameter --name "/codebuild/github-token" --with-decryption --query "Parameter.Value" --output text --region us-east-1)
  export GITHUB_TOKEN
  
  # Create a GitHub release with the artifacts
  RELEASE_TAG="boot2qt-build-${CODEBUILD_BUILD_NUMBER}"
  gh release create "$RELEASE_TAG" \
    --title "Boot to Qt Build ${CODEBUILD_BUILD_NUMBER}" \
    --generate-notes=false \
    --notes "Automated Boot to Qt build from GitHub Actions via CodeBuild

**Build Information:**
- Build Date: $(date)
- Qt Version: 6.8.3
- Platform: Boot to Qt AWS EC2 ARM64
- CodeBuild ID: $CODEBUILD_BUILD_ID
- Source Version: $CODEBUILD_RESOLVED_SOURCE_VERSION
- Triggered by: GitHub Actions

**Artifacts:**
- ClusterApp: Cross-compiled Qt application for AWS EC2 ARM64
- deploy.sh: Deployment script for AWS EC2
- build_info.txt: Detailed build information" \
    artifacts/antares-cluster-boot2qt-${CODEBUILD_BUILD_NUMBER}.tar.gz
  
  echo "Build completed successfully!"
else
  echo "No toolchain environment script found"
  exit 1
fi