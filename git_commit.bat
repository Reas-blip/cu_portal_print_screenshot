@echo off
REM Get the directory where this script is located
set REPO_DIR=%~dp0

REM Navigate to the repository
cd /d "%REPO_DIR%"

REM Add all changes to staging
git add .

REM Commit with a timestamp message
set commit_message=Auto commit on %DATE% %TIME%
git commit -m "%commit_message%"
git push origin main
REM Push to the remote repository (default branch: main)


REM Print success message
echo.
echo ============================
echo   Git Commit & Push Done!
echo ============================
echo.

pause
