# GitHub Workflows

This directory contains the GitHub Actions workflows and build scripts for the Antares project.

## Boot to Qt Build Workflow

The main workflow builds the Cluster application for Boot to Qt on AWS EC2 ARM64 architecture.

### Files

- **`boot2qt-build.yml`** - GitHub Actions workflow that triggers the build
- **`build-boot2qt.sh`** - Build script that handles Qt installation and cross-compilation

### How It Works

1. **Trigger**: The workflow runs automatically on:
   - Push to `main` branch
   - Pull requests to `main` branch
   - Manual trigger via GitHub Actions UI

2. **GitHub Actions**: The workflow runs on a standard Ubuntu runner and:
   - Configures AWS credentials
   - Starts the CodeBuild project
   - Waits for build completion
   - Reports status back to GitHub

3. **CodeBuild Execution**: AWS CodeBuild runs the build script which:
   - Installs system dependencies and GitHub CLI
   - Retrieves Qt credentials from AWS Parameter Store
   - Downloads and installs Qt 6.8.3 with Boot to Qt components
   - Sets up the cross-compilation toolchain
   - Builds the Common Library and Cluster application
   - Creates deployment artifacts

4. **Artifacts**: The build produces:
   - `ClusterApp` - Cross-compiled Qt application for AWS EC2 ARM64
   - `deploy.sh` - Deployment script for AWS EC2
   - `build_info.txt` - Detailed build information

5. **GitHub Release**: Automatically creates a GitHub release with:
   - Tag: `boot2qt-build-{BUILD_NUMBER}`
   - Compressed archive with all artifacts
   - Build information in release notes

### Prerequisites

The workflow requires these GitHub Secrets:
- `AWS_ACCESS_KEY_ID` - AWS access key for CodeBuild
- `AWS_SECRET_ACCESS_KEY` - AWS secret access key

The workflow uses these AWS Parameter Store values:
- `/codebuild/qt-email` - Qt account email
- `/codebuild/qt-password` - Qt account password (encrypted)
- `/codebuild/github-token` - GitHub personal access token for releases

### AWS Resources

The workflow uses these AWS resources:
- **CodeBuild Project**: `antares-cluster-boot2qt-docker`
- **IAM Role**: `CodeBuildServiceRole-antares-cluster-boot2qt`
- **Build Environment**: `aws/codebuild/standard:7.0` (Ubuntu 22.04)
- **Compute**: `BUILD_GENERAL1_LARGE` (7 GB RAM, 4 vCPUs)

### Manual Trigger

To manually trigger a build:
1. Go to [Actions tab](https://github.com/tbfouts/antares/actions)
2. Click "Boot to Qt Build"
3. Click "Run workflow"
4. Select branch and click "Run workflow"

### Build Output

After a successful build, you can find:
- **Build status** in the GitHub Actions UI
- **Artifacts** in GitHub Releases
- **Detailed logs** in AWS CodeBuild console

### Troubleshooting

Common issues:
- **AWS credentials**: Ensure GitHub Secrets are set correctly
- **Qt credentials**: Verify Parameter Store values are correct
- **Build failures**: Check AWS CodeBuild logs for detailed error messages
- **Missing releases**: Ensure GitHub token has `repo` scope

### Architecture

```
GitHub Push → GitHub Actions → AWS CodeBuild → Build Script → GitHub Release
     ↓              ↓               ↓              ↓              ↓
  Trigger      Configure AWS   Install Qt    Build App     Upload Artifacts
  Workflow     Start Build     Cross-compile              Create Release
```

This setup provides a robust, automated build pipeline for cross-compiling Qt applications to Boot to Qt on AWS EC2 ARM64 architecture.