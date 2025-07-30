@echo off
echo 🚀 SAGAPI-Proto Deployment Setup
echo =================================

REM Check if git is initialized
if not exist ".git" (
    echo 📁 Initializing Git repository...
    git init
)

REM Add files to git
echo 📦 Adding files to Git...
git add .

REM Commit changes  
echo 💾 Committing changes...
set /p commit_msg="Enter commit message (default: 'Initial deployment'): "
if "%commit_msg%"=="" set commit_msg=Initial deployment
git commit -m "%commit_msg%"

REM Check if remote exists
git remote get-url origin >nul 2>&1
if errorlevel 1 (
    echo 🔗 Setting up GitHub remote...
    set /p repo_url="Enter GitHub repository URL: "
    git remote add origin !repo_url!
)

REM Push to GitHub
echo ⬆️ Pushing to GitHub...
git branch -M main
git push -u origin main

echo.
echo ✅ Deployment ready!
echo.
echo 📋 Next steps for Railway deployment:
echo 1. Go to https://railway.app
echo 2. Connect your GitHub account
echo 3. Create new project from GitHub repo
echo 4. Railway will automatically detect Python and use Procfile
echo 5. Your app will be deployed automatically!
echo.
echo 🌐 Local development: python app.py
echo 🔧 Production server: gunicorn app:app
echo.
pause
