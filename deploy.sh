#!/bin/bash

# SAGAPI-Proto Deployment Script
echo "🚀 SAGAPI-Proto Deployment Setup"
echo "================================="

# Check if git is initialized
if [ ! -d ".git" ]; then
    echo "📁 Initializing Git repository..."
    git init
fi

# Add files to git
echo "📦 Adding files to Git..."
git add .

# Commit changes
echo "💾 Committing changes..."
read -p "Enter commit message (default: 'Initial deployment'): " commit_msg
commit_msg=${commit_msg:-"Initial deployment"}
git commit -m "$commit_msg"

# Check if remote exists
if ! git remote get-url origin > /dev/null 2>&1; then
    echo "🔗 Setting up GitHub remote..."
    read -p "Enter GitHub repository URL: " repo_url
    git remote add origin $repo_url
fi

# Push to GitHub
echo "⬆️ Pushing to GitHub..."
git branch -M main
git push -u origin main

echo ""
echo "✅ Deployment ready!"
echo ""
echo "📋 Next steps for Railway deployment:"
echo "1. Go to https://railway.app"
echo "2. Connect your GitHub account"
echo "3. Create new project from GitHub repo"
echo "4. Railway will automatically detect Python and use Procfile"
echo "5. Your app will be deployed automatically!"
echo ""
echo "🌐 Local development: python app.py"
echo "🔧 Production server: gunicorn app:app"
echo ""
