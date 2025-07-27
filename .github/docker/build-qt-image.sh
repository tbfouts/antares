#!/bin/bash
set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

echo -e "${GREEN}=== Qt Docker Image Builder ===${NC}"
echo "This script will build a Docker image with Qt 6.8.3 and Boot2Qt components."
echo

# Prompt for Qt credentials
echo -e "${YELLOW}Please enter your Qt account credentials:${NC}"
read -p "Qt Email: " QT_EMAIL
read -s -p "Qt Password: " QT_PASSWORD
echo

if [ -z "$QT_EMAIL" ] || [ -z "$QT_PASSWORD" ]; then
    echo -e "${RED}Error: Both email and password are required${NC}"
    exit 1
fi

# Get AWS account ID for ECR repository naming
AWS_ACCOUNT_ID=$(aws sts get-caller-identity --query Account --output text 2>/dev/null || echo "")
AWS_REGION=${AWS_DEFAULT_REGION:-us-east-1}

if [ -z "$AWS_ACCOUNT_ID" ]; then
    echo -e "${YELLOW}Warning: Could not detect AWS account ID. ECR tagging will be skipped.${NC}"
    ECR_REPO=""
else
    ECR_REPO="${AWS_ACCOUNT_ID}.dkr.ecr.${AWS_REGION}.amazonaws.com/antares-qt"
    echo -e "${GREEN}Detected AWS Account: ${AWS_ACCOUNT_ID}${NC}"
    echo -e "${GREEN}ECR Repository: ${ECR_REPO}${NC}"
fi

# Image name and tag
IMAGE_NAME="antares-qt"
IMAGE_TAG="6.8.3-boot2qt"
FULL_IMAGE_NAME="${IMAGE_NAME}:${IMAGE_TAG}"

echo
echo -e "${GREEN}Building Docker image: ${FULL_IMAGE_NAME}${NC}"
echo "This may take 15-30 minutes depending on your internet connection..."
echo

# Build the Docker image with x86-64 platform
docker build \
    --platform linux/amd64 \
    --build-arg QT_EMAIL="$QT_EMAIL" \
    --build-arg QT_PASSWORD="$QT_PASSWORD" \
    -t "$FULL_IMAGE_NAME" \
    .

if [ $? -eq 0 ]; then
    echo
    echo -e "${GREEN}✓ Docker image built successfully: ${FULL_IMAGE_NAME}${NC}"
    
    # Tag for ECR if AWS account detected
    if [ -n "$ECR_REPO" ]; then
        echo -e "${GREEN}Tagging for ECR: ${ECR_REPO}:${IMAGE_TAG}${NC}"
        docker tag "$FULL_IMAGE_NAME" "${ECR_REPO}:${IMAGE_TAG}"
        docker tag "$FULL_IMAGE_NAME" "${ECR_REPO}:latest"
        echo -e "${GREEN}✓ Image tagged for ECR${NC}"
    fi
    
    echo
    echo -e "${GREEN}Image is ready for use!${NC}"
    echo -e "Local image: ${FULL_IMAGE_NAME}"
    if [ -n "$ECR_REPO" ]; then
        echo -e "ECR image: ${ECR_REPO}:${IMAGE_TAG}"
        echo -e "ECR latest: ${ECR_REPO}:latest"
        echo
        echo -e "${YELLOW}To push to ECR, run:${NC}"
        echo -e "  ./push-to-ecr.sh"
    fi
else
    echo -e "${RED}✗ Docker build failed${NC}"
    exit 1
fi