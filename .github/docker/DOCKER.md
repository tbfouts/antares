# Docker Build Environment

This directory contains Docker configuration for building Qt applications with Boot2Qt support.

## Files

- `Dockerfile` - Ubuntu 22.04 based image with Qt 6.8.3 and Boot2Qt toolchain
- `build-qt-image.sh` - Interactive script to build the Docker image
- `push-to-ecr.sh` - Script to push built image to AWS ECR

## Usage

1. Build the image:
   ```bash
   ./build-qt-image.sh
   ```

2. Push to ECR (optional):
   ```bash
   ./push-to-ecr.sh
   ```

## Requirements

- Docker with Linux/AMD64 platform support
- Qt account credentials for image build
- AWS CLI configured for ECR operations