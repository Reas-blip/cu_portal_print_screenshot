@echo off
REM Set the repository directory (change this to your repo's path if needed)
set REPO_DIR=%cd%

REM Navigate to the repository
cd /d "%REPO_DIR%"

REM Add all changes to staging
git add .

REM Commit with a timestamp message
set commit_message=Auto commit on %DATE% %TIME%
git commit -m "%commit_message%"

REM Push to the remote repository (default branch: main)
git push origin main

REM Print success message
echo.
echo ============================
echo   Git Commit & Push Done!
echo ============================
echo.

pause
