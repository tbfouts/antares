#!/bin/bash
set -e

echo "=== Qt Boot to Qt Build Script ==="
echo "Build started at: $(date)"

# Install system dependencies
echo "Installing system dependencies..."
sudo apt-get update

# Install GitHub CLI
echo "Installing GitHub CLI..."
curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null
sudo apt-get update
sudo apt-get install -y gh

sudo apt-get install -y \
  build-essential \
  cmake \
  ninja-build \
  curl \
  git \
  gawk \
  wget \
  diffstat \
  unzip \
  texinfo \
  chrpath \
  socat \
  cpio \
  python3 \
  python3-pexpect \
  xz-utils \
  debianutils \
  iputils-ping \
  python3-git \
  python3-jinja2 \
  python3-subunit \
  zstd \
  liblz4-tool \
  file \
  locales \
  libacl1 \
  libusb-1.0-0 \
  libgl1-mesa-dev \
  libfontconfig1-dev \
  libfreetype6-dev \
  libx11-dev \
  libx11-xcb-dev \
  libxext-dev \
  libxfixes-dev \
  libxi-dev \
  libxrender-dev \
  libxcb1-dev \
  libxcb-cursor-dev \
  libxcb-glx0-dev \
  libxcb-keysyms1-dev \
  libxcb-image0-dev \
  libxcb-shm0-dev \
  libxcb-icccm4-dev \
  libxcb-sync-dev \
  libxcb-xfixes0-dev \
  libxcb-shape0-dev \
  libxcb-randr0-dev \
  libxcb-render-util0-dev \
  libxcb-util-dev \
  libxcb-xinerama0-dev \
  libxcb-xkb-dev \
  libxkbcommon-dev \
  libxkbcommon-x11-dev \
  libdbus-1-dev \
  libpulse-dev

# Retrieve Qt credentials from Parameter Store
echo "Retrieving Qt credentials from Parameter Store..."
QT_EMAIL=$(aws ssm get-parameter --name "/codebuild/qt-email" --query "Parameter.Value" --output text --region us-east-1)
QT_PASSWORD=$(aws ssm get-parameter --name "/codebuild/qt-password" --with-decryption --query "Parameter.Value" --output text --region us-east-1)

if [ -z "$QT_EMAIL" ] || [ -z "$QT_PASSWORD" ]; then
    echo "Error: Failed to retrieve Qt credentials from Parameter Store"
    exit 1
fi

# Download Qt installer
echo "Downloading Qt installer..."
wget -O qt-online-installer-linux-x64-online.run https://download.qt.io/official_releases/online_installers/qt-online-installer-linux-x64-online.run
chmod +x qt-online-installer-linux-x64-online.run

# Install Qt components
echo "Installing Qt 6.8.3 with Boot to Qt components..."
./qt-online-installer-linux-x64-online.run --headless --verbose --accept-licenses --confirm-command \
  --email "$QT_EMAIL" --password "$QT_PASSWORD" \
  --default-answer --auto-answer installationErrorWithCancel=Ignore --root /opt/Qt \
  install qt.qt6.683.linux_gcc_64 qt.qt6.683.addons.qtshadertools embedded.b2qt.683 embedded.b2qt.683.awsec2arm64 embedded.b2qt.683.awsec2arm64.toolchain

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
  
  echo "Building Common Library for Boot to Qt..."
  cd $CODEBUILD_SRC_DIR/common
  mkdir build-boot2qt && cd build-boot2qt
  
  cmake .. \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_TOOLCHAIN_FILE=$OECORE_CMAKE_TOOLCHAIN_FILE \
    -DQt6_DIR=$OECORE_TARGET_SYSROOT/usr/lib/cmake/Qt6 \
    -DQT_HOST_PATH=/opt/Qt/6.8.3/gcc_64
  cmake --build .
  
  echo "Building Cluster Application for Boot to Qt..."
  cd $CODEBUILD_SRC_DIR/Cluster
  mkdir build-boot2qt && cd build-boot2qt
  
  cmake .. \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_TOOLCHAIN_FILE=$OECORE_CMAKE_TOOLCHAIN_FILE \
    -DQt6_DIR=$OECORE_TARGET_SYSROOT/usr/lib/cmake/Qt6 \
    -DQT_HOST_PATH=/opt/Qt/6.8.3/gcc_64
  cmake --build .
  
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