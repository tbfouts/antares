#!/bin/bash
set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

echo -e "${GREEN}=== ECR Push Script ===${NC}"
echo "This script will push the Qt Docker image to AWS ECR."
echo

# Get AWS account information
AWS_ACCOUNT_ID=$(aws sts get-caller-identity --query Account --output text 2>/dev/null || echo "")
AWS_REGION=${AWS_DEFAULT_REGION:-us-east-1}

if [ -z "$AWS_ACCOUNT_ID" ]; then
    echo -e "${RED}Error: Could not detect AWS account ID. Make sure AWS CLI is configured.${NC}"
    echo "Run: aws configure"
    exit 1
fi

ECR_REPO="${AWS_ACCOUNT_ID}.dkr.ecr.${AWS_REGION}.amazonaws.com/antares-qt"
IMAGE_TAG="6.8.3-boot2qt"
LOCAL_IMAGE="antares-qt:${IMAGE_TAG}"

echo -e "${GREEN}AWS Account: ${AWS_ACCOUNT_ID}${NC}"
echo -e "${GREEN}AWS Region: ${AWS_REGION}${NC}"
echo -e "${GREEN}ECR Repository: ${ECR_REPO}${NC}"
echo

# Check if local image exists
if ! docker image inspect "$LOCAL_IMAGE" >/dev/null 2>&1; then
    echo -e "${RED}Error: Local image ${LOCAL_IMAGE} not found${NC}"
    echo -e "${YELLOW}Please run ./build-qt-image.sh first${NC}"
    exit 1
fi

echo -e "${GREEN}✓ Local image found: ${LOCAL_IMAGE}${NC}"

# Check if the ECR repository exists, create if it doesn't
echo "Checking if ECR repository exists..."
if ! aws ecr describe-repositories --repository-names antares-qt --region $AWS_REGION >/dev/null 2>&1; then
    echo -e "${YELLOW}ECR repository doesn't exist. Creating it...${NC}"
    aws ecr create-repository \
        --repository-name antares-qt \
        --region $AWS_REGION \
        --image-scanning-configuration scanOnPush=true
    echo -e "${GREEN}✓ ECR repository created${NC}"
else
    echo -e "${GREEN}✓ ECR repository exists${NC}"
fi

# Login to ECR
echo "Logging into ECR..."
aws ecr get-login-password --region $AWS_REGION | docker login --username AWS --password-stdin $ECR_REPO
echo -e "${GREEN}✓ Logged into ECR${NC}"

# Tag images for ECR
echo "Tagging images..."
docker tag "$LOCAL_IMAGE" "${ECR_REPO}:${IMAGE_TAG}"
docker tag "$LOCAL_IMAGE" "${ECR_REPO}:latest"
echo -e "${GREEN}✓ Images tagged for ECR${NC}"

# Push images
echo
echo "Pushing images to ECR..."
echo -e "${YELLOW}Pushing ${ECR_REPO}:${IMAGE_TAG}...${NC}"
docker push "${ECR_REPO}:${IMAGE_TAG}"

echo -e "${YELLOW}Pushing ${ECR_REPO}:latest...${NC}"
docker push "${ECR_REPO}:latest"

echo
echo -e "${GREEN}✓ Successfully pushed images to ECR!${NC}"
echo
echo -e "${GREEN}Available images:${NC}"
echo -e "  ${ECR_REPO}:${IMAGE_TAG}"
echo -e "  ${ECR_REPO}:latest"
echo
echo -e "${YELLOW}To use this image in CodeBuild, update your buildspec.yml with:${NC}"
echo -e "  image: ${ECR_REPO}:latest"
echo
echo -e "${GREEN}Push completed successfully!${NC}"