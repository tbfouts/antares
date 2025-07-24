#!/bin/bash

# EC2 Deployment Script for Boot2Qt Application
# Deploys successful builds to AWS EC2 instance with Boot2Qt AMI

set -e

# Configuration
AMI_ID="ami-0c02fb55956c7d316"  # Boot2Qt 6.8.3 AMI for us-east-1
INSTANCE_TYPE="g5g.large"       # GPU-enabled ARM64 instance
REGION="us-east-1"              # AWS region
KEY_NAME="${EC2_KEY_NAME}"      # SSH key pair name
SECURITY_GROUP="${EC2_SECURITY_GROUP:-boot2qt-sg}"
SUBNET_ID="${EC2_SUBNET_ID}"    # Optional: specify subnet

echo "Starting EC2 deployment process..."

# Function to create security group if it doesn't exist
create_security_group() {
    if ! aws ec2 describe-security-groups --group-names "$SECURITY_GROUP" --region "$REGION" >/dev/null 2>&1; then
        echo "Creating security group: $SECURITY_GROUP"
        SECURITY_GROUP_ID=$(aws ec2 create-security-group \
            --group-name "$SECURITY_GROUP" \
            --description "Security group for Boot2Qt deployment" \
            --region "$REGION" \
            --query 'GroupId' --output text)
        
        # Add SSH access
        aws ec2 authorize-security-group-ingress \
            --group-id "$SECURITY_GROUP_ID" \
            --protocol tcp --port 22 --cidr 0.0.0.0/0 \
            --region "$REGION"
        
        # Add Qt debugging ports (if needed)
        aws ec2 authorize-security-group-ingress \
            --group-id "$SECURITY_GROUP_ID" \
            --protocol tcp --port 3768 --cidr 0.0.0.0/0 \
            --region "$REGION"
        
        echo "Security group created: $SECURITY_GROUP_ID"
    else
        echo "Security group $SECURITY_GROUP already exists"
        SECURITY_GROUP_ID=$(aws ec2 describe-security-groups \
            --group-names "$SECURITY_GROUP" \
            --region "$REGION" \
            --query 'SecurityGroups[0].GroupId' --output text)
    fi
}

# Function to launch EC2 instance
launch_instance() {
    echo "Launching EC2 instance..."
    
    # Build launch command
    LAUNCH_CMD="aws ec2 run-instances \
        --image-id $AMI_ID \
        --instance-type $INSTANCE_TYPE \
        --key-name $KEY_NAME \
        --security-group-ids $SECURITY_GROUP_ID \
        --region $REGION \
        --tag-specifications 'ResourceType=instance,Tags=[{Key=Name,Value=antares-boot2qt-deployment},{Key=Project,Value=antares},{Key=Environment,Value=staging}]'"
    
    # Add subnet if specified
    if [ -n "$SUBNET_ID" ]; then
        LAUNCH_CMD="$LAUNCH_CMD --subnet-id $SUBNET_ID"
    fi
    
    # Launch instance
    INSTANCE_ID=$(eval $LAUNCH_CMD --query 'Instances[0].InstanceId' --output text)
    echo "Instance launched: $INSTANCE_ID"
    
    # Wait for instance to be running
    echo "Waiting for instance to be running..."
    aws ec2 wait instance-running --instance-ids "$INSTANCE_ID" --region "$REGION"
    
    # Get public IP
    PUBLIC_IP=$(aws ec2 describe-instances \
        --instance-ids "$INSTANCE_ID" \
        --region "$REGION" \
        --query 'Reservations[0].Instances[0].PublicIpAddress' --output text)
    
    echo "Instance is running at: $PUBLIC_IP"
    echo "INSTANCE_ID=$INSTANCE_ID" >> $GITHUB_ENV
    echo "PUBLIC_IP=$PUBLIC_IP" >> $GITHUB_ENV
}

# Function to wait for SSH availability
wait_for_ssh() {
    echo "Waiting for SSH to be available..."
    for i in {1..30}; do
        if ssh -o ConnectTimeout=5 -o StrictHostKeyChecking=no -i ~/.ssh/id_rsa root@"$PUBLIC_IP" 'echo "SSH connection successful"' >/dev/null 2>&1; then
            echo "SSH is available"
            return 0
        fi
        echo "Attempt $i: SSH not ready, waiting 10 seconds..."
        sleep 10
    done
    echo "Error: SSH connection failed after 5 minutes"
    exit 1
}

# Function to deploy application
deploy_application() {
    echo "Deploying application to EC2 instance..."
    
    # Create deployment directory on target
    ssh -o StrictHostKeyChecking=no -i ~/.ssh/id_rsa root@"$PUBLIC_IP" '
        mkdir -p /opt/antares
        cd /opt/antares
    '
    
    # Copy application files
    echo "Copying application files..."
    scp -o StrictHostKeyChecking=no -i ~/.ssh/id_rsa -r ./build-artifacts/* root@"$PUBLIC_IP":/opt/antares/
    
    # Set executable permissions and run
    ssh -o StrictHostKeyChecking=no -i ~/.ssh/id_rsa root@"$PUBLIC_IP" '
        cd /opt/antares
        chmod +x ClusterApp deploy.sh
        
        # Set environment for GPU acceleration
        export QT_QPA_PLATFORM=eglfs
        export QT_QPA_EGLFS_INTEGRATION=eglfs_kms
        
        echo "Application deployed successfully"
        echo "To run the cluster app: ./ClusterApp"
        echo "Or use the deployment script: ./deploy.sh"
        
        # Start the application (background process)
        nohup ./ClusterApp > cluster.log 2>&1 &
        
        echo "Cluster application started in background"
        echo "Cluster log: /opt/antares/cluster.log"
        echo "Build info: /opt/antares/build_info.txt"
    '
    
    echo "Deployment completed successfully!"
    echo "Access the instance via SSH: ssh -i ~/.ssh/id_rsa root@$PUBLIC_IP"
    echo "Application directory: /opt/antares"
}

# Main execution
main() {
    # Validate required environment variables
    if [ -z "$KEY_NAME" ]; then
        echo "Error: EC2_KEY_NAME environment variable is required"
        exit 1
    fi
    
    # Check if build artifacts exist
    if [ ! -d "./build-artifacts" ]; then
        echo "Error: build-artifacts directory not found"
        exit 1
    fi
    
    # Execute deployment steps
    create_security_group
    launch_instance
    wait_for_ssh
    deploy_application
    
    echo "EC2 deployment completed successfully!"
    echo "Instance ID: $INSTANCE_ID"
    echo "Public IP: $PUBLIC_IP"
}

# Run main function
main "$@"