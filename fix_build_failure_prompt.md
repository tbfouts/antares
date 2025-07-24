# CodeBuild Failure Auto-Fix Request

I need you to analyze and fix this CodeBuild failure:

**Build Details:**
- Build ID: antares-cluster-boot2qt-docker:dde69a95-e9eb-4d7b-ac76-03f449a1873d
- Status: FAILED  
- Project: antares-cluster-boot2qt-docker
- Workflow: Boot to Qt Build

**Your Task:**
1. Examine the build failure logs in `codebuild_failure_logs.txt`
2. Analyze the repository structure and build scripts
3. Identify the root cause of the failure
4. Make the necessary code changes to fix the issue
5. Create a branch and PR with your fixes

**Key Files to Consider:**
- `.github/workflows/build-boot2qt.sh` (main build script)
- `.github/workflows/boot2qt-build.yml` (workflow definition)
- Any CMake files or configuration that might be causing issues

**Requirements:**
- IMPORTANT: Actually modify the files to fix the problem using Edit tool
- Create a new branch with: git checkout -b fix/codebuild-antares-cluster-boot2qt-docker:dde69a95-e9eb-4d7b-ac76-03f449a1873d
- After making changes, commit with: git add . && git commit -m "Fix build failure"
- Push branch with: git push origin fix/codebuild-antares-cluster-boot2qt-docker:dde69a95-e9eb-4d7b-ac76-03f449a1873d
- Create PR with: gh pr create --title "Fix CodeBuild failure" --body "Auto-fix from Claude Code analysis" --draft
- This is running in GitHub Actions - you MUST actually execute these commands

Please start by reading the failure logs and then systematically work through the fix.
