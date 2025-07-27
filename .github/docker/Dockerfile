FROM ubuntu:22.04

# Set environment variables to avoid interactive prompts
ENV DEBIAN_FRONTEND=noninteractive
ENV QT_VERSION=6.8.3
ENV QT_DIR=/opt/Qt
ENV PATH=$QT_DIR/$QT_VERSION/gcc_64/bin:$PATH

# Install system dependencies (based on build-boot2qt.sh)
RUN apt-get update && apt-get install -y \
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
    libpulse-dev \
    && rm -rf /var/lib/apt/lists/*

# Install AWS CLI
RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" \
    && unzip awscliv2.zip \
    && ./aws/install \
    && rm -rf awscliv2.zip aws/

# Create Qt installation directory
RUN mkdir -p $QT_DIR

# Download Qt installer
RUN wget -O /tmp/qt-online-installer-linux-x64-online.run \
    https://download.qt.io/official_releases/online_installers/qt-online-installer-linux-x64-online.run \
    && chmod +x /tmp/qt-online-installer-linux-x64-online.run

# Install Qt during build (credentials passed as build args)
ARG QT_EMAIL
ARG QT_PASSWORD
RUN /tmp/qt-online-installer-linux-x64-online.run --headless --verbose --accept-licenses --confirm-command \
    --email "$QT_EMAIL" --password "$QT_PASSWORD" \
    --default-answer --auto-answer installationErrorWithCancel=Ignore --root /opt/Qt \
    install qt.qt6.683.linux_gcc_64 qt.qt6.683.addons.qtshadertools embedded.b2qt.683 embedded.b2qt.683.awsec2arm64 embedded.b2qt.683.awsec2arm64.toolchain \
    && rm /tmp/qt-online-installer-linux-x64-online.run

# Set up environment
ENV QTDIR=$QT_DIR/$QT_VERSION/gcc_64
ENV CMAKE_PREFIX_PATH=$QTDIR/lib/cmake
ENV BOOT2QT_DIR=$QT_DIR/$QT_VERSION/Boot2Qt

# Extract Boot2Qt toolchain installer
RUN BOOT2QT_DIR=$QT_DIR/$QT_VERSION/Boot2Qt && \
    TOOLCHAIN_INSTALLER=$(find $BOOT2QT_DIR -name "*.sh" -type f | head -1) && \
    if [ -f "$TOOLCHAIN_INSTALLER" ]; then \
        echo "Extracting Boot2Qt toolchain installer: $TOOLCHAIN_INSTALLER" && \
        echo "Installer size: $(ls -lh "$TOOLCHAIN_INSTALLER" | awk '{print $5}')" && \
        echo "Current toolchain directory before extraction:" && \
        ls -la "$BOOT2QT_DIR/aws-ec2-arm64/toolchain/" && \
        chmod +x "$TOOLCHAIN_INSTALLER" && \
        echo "Running installer to extract toolchain..." && \
        "$TOOLCHAIN_INSTALLER" -y -d "$BOOT2QT_DIR/aws-ec2-arm64/toolchain" && \
        echo "Boot2Qt toolchain extracted successfully" && \
        echo "Toolchain directory after extraction:" && \
        ls -la "$BOOT2QT_DIR/aws-ec2-arm64/toolchain/" && \
        echo "Checking for libgcc files after extraction:" && \
        find "$BOOT2QT_DIR" -name "*libgcc*" -type f | head -5 || echo "No libgcc files found"; \
        echo "Checking for .a files after extraction:" && \
        find "$BOOT2QT_DIR" -name "*.a" -type f | head -5 || echo "No .a files found"; \
    else \
        echo "No Boot2Qt toolchain installer found"; \
    fi

# Fix hardcoded paths in Boot2Qt toolchain (same as CodeBuild script)
RUN BOOT2QT_DIR=$QT_DIR/$QT_VERSION/Boot2Qt && \
    TOOLCHAIN_ENV_SCRIPT=$(find $BOOT2QT_DIR -name "environment-setup-*" -type f | head -1) && \
    if [ -f "$TOOLCHAIN_ENV_SCRIPT" ]; then \
        echo "Fixing hardcoded paths in Boot2Qt toolchain..." && \
        sed -i 's|/usr/local/oe-sdk-hardcoded-buildpath/sysroots|/opt/Qt/6.8.3/Boot2Qt/aws-ec2-arm64/toolchain/sysroots|g' "$TOOLCHAIN_ENV_SCRIPT" && \
        CMAKE_TOOLCHAIN_FILE="$BOOT2QT_DIR/aws-ec2-arm64/toolchain/sysroots/x86_64-pokysdk-linux/usr/share/cmake/OEToolchainConfig.cmake" && \
        if [ -f "$CMAKE_TOOLCHAIN_FILE" ]; then \
            sed -i 's|/usr/local/oe-sdk-hardcoded-buildpath/sysroots|/opt/Qt/6.8.3/Boot2Qt/aws-ec2-arm64/toolchain/sysroots|g' "$CMAKE_TOOLCHAIN_FILE"; \
        fi && \
        find "$BOOT2QT_DIR/aws-ec2-arm64/toolchain" -type f \( -name "*.cmake" -o -name "*.pc" -o -name "*.la" -o -name "*.conf" -o -name "*.prf" \) -exec sed -i 's|/usr/local/oe-sdk-hardcoded-buildpath/sysroots|/opt/Qt/6.8.3/Boot2Qt/aws-ec2-arm64/toolchain/sysroots|g' {} \; 2>/dev/null || true; \
    fi

# Clean up large files to save space (but keep .a static libraries for Boot2Qt)
RUN find $QT_DIR -name "*.debug" -delete 2>/dev/null || true && \
    rm -rf $QT_DIR/*/Docs 2>/dev/null || true && \
    rm -rf $QT_DIR/*/Examples 2>/dev/null || true

WORKDIR /workspace

CMD ["/bin/bash"]