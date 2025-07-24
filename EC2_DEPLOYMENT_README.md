# EC2 Deployment Setup

This document explains how to configure AWS EC2 deployment for the Antares Boot2Qt application.

## Prerequisites

1. **AWS Account** with appropriate permissions
2. **Boot2Qt 6.8 AMI** subscription from AWS Marketplace
3. **EC2 Key Pair** for SSH access
4. **GitHub Secrets** configured (see below)

## Required GitHub Secrets

Add these secrets to your GitHub repository settings:

### Required Secrets
- `EC2_KEY_NAME`: Name of your EC2 key pair (e.g., "antares-deployment-key")
- `EC2_PRIVATE_KEY`: Private key content (PEM format) for SSH access

### Optional Secrets
- `EC2_SECURITY_GROUP`: Security group name (defaults to "boot2qt-sg")
- `EC2_SUBNET_ID`: Specific subnet ID for instance placement

## Setup Steps

### 1. Subscribe to Boot2Qt AMI
1. Visit [Boot2Qt 6.8 AMI on AWS Marketplace](https://aws.amazon.com/marketplace/pp/prodview-t5ktjcktc7izy)
2. Click "Continue to Subscribe"
3. Accept terms and configure pricing

### 2. Create EC2 Key Pair
```bash
# Create new key pair
aws ec2 create-key-pair --key-name antares-deployment-key --query 'KeyMaterial' --output text > antares-deployment-key.pem
chmod 400 antares-deployment-key.pem

# Add the private key content to GitHub Secrets as EC2_PRIVATE_KEY
cat antares-deployment-key.pem
```

### 3. Configure GitHub Secrets
1. Go to your repository's Settings → Secrets and variables → Actions
2. Add the required secrets:
   - `EC2_KEY_NAME`: `antares-deployment-key`
   - `EC2_PRIVATE_KEY`: Content of your `.pem` file

### 4. Update AMI ID (if needed)
The deployment script uses a default AMI ID. Update it in `.github/workflows/deploy-to-ec2.sh` if needed:
```bash
AMI_ID="ami-0c02fb55956c7d316"  # Update for your region
```

## Deployment Process

When code is pushed to `main`:

1. **Build**: GitHub Actions triggers AWS CodeBuild
2. **Success**: Downloads build artifacts from S3
3. **Deploy**: Launches new EC2 instance with Boot2Qt AMI
4. **Install**: Copies and runs the application
5. **Summary**: Provides SSH access details

## Instance Configuration

- **Instance Type**: g5g.large (ARM64 with GPU)
- **AMI**: Boot2Qt 6.8.3 for ARM64
- **Security Group**: Allows SSH (port 22) and Qt debugging (port 3768)
- **Application Path**: `/opt/antares/`

## Accessing the Deployed Application

After successful deployment:

```bash
# SSH into the instance
ssh -i your-key.pem root@<PUBLIC_IP>

# Navigate to application directory
cd /opt/antares

# Run applications
./GLOApp         # Cluster application
./QtMediaSwipeApp # IVI application

# Check logs
tail -f cluster.log
tail -f ivi.log
```

## Cost Management

- **Instance Cost**: ~$0.25/hour for g5g.large + Boot2Qt licensing
- **Auto-termination**: Consider adding instance auto-termination for cost control
- **Monitoring**: Set up CloudWatch billing alerts

## Troubleshooting

### SSH Connection Issues
```bash
# Verify security group allows SSH
aws ec2 describe-security-groups --group-names boot2qt-sg

# Check instance status
aws ec2 describe-instances --instance-ids <INSTANCE_ID>
```

### Application Issues
```bash
# Check if applications are running
ps aux | grep -E "(GLOApp|QtMediaSwipeApp)"

# Check Qt environment
echo $QT_QPA_PLATFORM
echo $QT_QPA_EGLFS_INTEGRATION
```

### Build Artifacts Missing
- Verify CodeBuild project outputs artifacts to S3
- Check S3 bucket permissions
- Ensure build script creates the expected binaries

## Security Notes

- Instances are launched with public IPs for easy access
- Consider using private subnets with bastion hosts for production
- Regularly rotate SSH keys
- Monitor instance access logs
- Use IAM roles instead of hardcoded credentials where possible