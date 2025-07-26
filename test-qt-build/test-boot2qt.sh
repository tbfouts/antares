#!/bin/bash
set -e

echo "Testing Boot2Qt AWS EC2 ARM64 cross-compilation..."

# Run the cross-compilation build in the Docker container
docker run --rm -v "$(pwd)":/workspace -w /workspace \
  antares-qt:6.8.3-boot2qt \
  bash -c "
    echo 'Setting up Boot2Qt environment:'
    source /opt/Qt/6.8.3/Boot2Qt/aws-ec2-arm64/toolchain/environment-setup-armv8-2a-poky-linux
    
    echo 'Cross-compiler: '\$CC
    echo 'Target arch: '\$OECORE_TARGET_ARCH  
    echo 'Sysroot: '\$OECORE_TARGET_SYSROOT
    echo 'Qt6 dir: '\$OECORE_TARGET_SYSROOT/usr/lib/cmake/Qt6
    echo ''
    
    echo 'Building Qt Hello World for AWS EC2 ARM64:'
    mkdir -p build-boot2qt && cd build-boot2qt
    
    cmake .. \
      -DCMAKE_BUILD_TYPE=Release \
      -DCMAKE_TOOLCHAIN_FILE=\$OECORE_CMAKE_TOOLCHAIN_FILE \
      -DQt6_DIR=\$OECORE_TARGET_SYSROOT/usr/lib/cmake/Qt6 \
      -DQT_HOST_PATH=/opt/Qt/6.8.3/gcc_64
      
    cmake --build .
    
    echo ''
    echo 'Checking the built binary:'
    file QtHelloWorld
    ldd QtHelloWorld || echo 'Cannot run ldd on cross-compiled binary (expected)'
  "

echo "Boot2Qt cross-compilation test completed!"