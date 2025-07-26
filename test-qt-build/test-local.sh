#!/bin/bash
set -e

echo "Testing Qt container locally..."

# Run the build in the Docker container
docker run --rm -v "$(pwd)":/workspace -w /workspace \
  antares-qt:6.8.3-boot2qt \
  bash -c "
    echo 'Qt installation check:'
    ls -la /opt/Qt/6.8.3/
    echo ''
    echo 'Building Qt Hello World:'
    mkdir -p build && cd build
    cmake -DCMAKE_BUILD_TYPE=Release ..
    cmake --build .
    echo ''
    echo 'Running application:'
    ./QtHelloWorld
  "

echo "Local test completed!"