#!/bin/bash

# 🚀 Flutter Web App Deployment Script
# Automatic deployment of Flutter web application to server

set -e  # Exit on any error

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Load configuration
CONFIG_FILE="./deploy_config.sh"
if [ ! -f "$CONFIG_FILE" ]; then
    echo -e "${RED}❌ Error: Configuration file not found!${NC}"
    echo -e "${YELLOW}Please copy deploy_config.sh.example to deploy_config.sh and fill in your credentials.${NC}"
    echo -e "${YELLOW}Command: cp deploy_config.sh.example deploy_config.sh${NC}"
    exit 1
fi

source "$CONFIG_FILE"

# Validate required configuration
if [ -z "$SERVER_IP" ] || [ -z "$SERVER_USER" ] || [ -z "$SERVER_PASSWORD" ]; then
    echo -e "${RED}❌ Error: Missing required configuration!${NC}"
    echo -e "${YELLOW}Please check your deploy_config.sh file.${NC}"
    exit 1
fi

# Set default paths if not configured
APP_PATH="${APP_PATH:-~/erpmax_web}"
BACKUP_PATH="${BACKUP_PATH:-~/backups/erpmax_web}"

echo -e "${BLUE}🚀 Starting Flutter Web App Deployment${NC}"
echo "=================================="

# Check if we're in the right directory
if [ ! -f "pubspec.yaml" ]; then
    echo -e "${RED}❌ Error: pubspec.yaml not found. Please run this script from the project root.${NC}"
    exit 1
fi

# Check Flutter installation
echo -e "${YELLOW}📋 Checking Flutter installation...${NC}"
if ! command -v flutter &> /dev/null; then
    echo -e "${RED}❌ Error: Flutter is not installed or not in PATH${NC}"
    exit 1
fi

# Check if sshpass is installed (for password authentication)
if ! command -v sshpass &> /dev/null; then
    echo -e "${YELLOW}⚠️  sshpass not found. Installing...${NC}"
    echo -e "${YELLOW}Please install sshpass manually:${NC}"
    echo -e "${YELLOW}  macOS: brew install hudochenkov/sshpass/sshpass${NC}"
    echo -e "${YELLOW}  Linux: sudo apt-get install sshpass${NC}"
    echo ""
    echo -e "${YELLOW}Alternatively, set up SSH key authentication to avoid using passwords.${NC}"
    exit 1
fi

# Check Flutter doctor
echo -e "${YELLOW}🔍 Running Flutter doctor...${NC}"
flutter doctor

# Clean previous build
echo -e "${YELLOW}🧹 Cleaning previous build...${NC}"
flutter clean

# Get dependencies
echo -e "${YELLOW}📦 Getting dependencies...${NC}"
flutter pub get

# Build the app
echo -e "${YELLOW}🔨 Building Flutter web app...${NC}"
flutter build web --release

if [ $? -ne 0 ]; then
    echo -e "${RED}❌ Build failed!${NC}"
    exit 1
fi

echo -e "${GREEN}✅ Build completed successfully!${NC}"

# Check if build/web directory exists
if [ ! -d "build/web" ]; then
    echo -e "${RED}❌ Error: build/web directory not found after build${NC}"
    exit 1
fi

# Create backup on server
echo -e "${YELLOW}💾 Creating backup on server...${NC}"
sshpass -p "$SERVER_PASSWORD" ssh -o StrictHostKeyChecking=no $SERVER_USER@$SERVER_IP "mkdir -p $BACKUP_PATH && if [ -d $APP_PATH ]; then cp -r $APP_PATH $BACKUP_PATH/backup_\$(date +%Y%m%d_%H%M%S) 2>/dev/null || true; fi" || true

if [ $? -eq 0 ]; then
    echo -e "${GREEN}✅ Backup attempt completed${NC}"
else
    echo -e "${YELLOW}⚠️  Backup skipped (may have permission issues)${NC}"
fi

# Create app directory on server and clean old files
echo -e "${YELLOW}📁 Preparing app directory on server...${NC}"
sshpass -p "$SERVER_PASSWORD" ssh -o StrictHostKeyChecking=no $SERVER_USER@$SERVER_IP "mkdir -p $APP_PATH && echo '$SERVER_PASSWORD' | sudo -S rm -rf $APP_PATH/* 2>/dev/null || rm -rf $APP_PATH/* 2>/dev/null || true"

# Upload to server
echo -e "${YELLOW}📤 Uploading to server...${NC}"
echo "Server: $SERVER_USER@$SERVER_IP"
echo "Path: $APP_PATH"

sshpass -p "$SERVER_PASSWORD" scp -o StrictHostKeyChecking=no -r build/web/* $SERVER_USER@$SERVER_IP:$APP_PATH/

if [ $? -ne 0 ]; then
    echo -e "${RED}❌ Upload failed!${NC}"
    exit 1
fi

echo -e "${GREEN}✅ Upload completed successfully!${NC}"

# Set permissions
echo -e "${YELLOW}🔐 Setting file permissions...${NC}"
sshpass -p "$SERVER_PASSWORD" ssh -o StrictHostKeyChecking=no $SERVER_USER@$SERVER_IP "find $APP_PATH -type f -exec chmod 644 {} \; && find $APP_PATH -type d -exec chmod 755 {} \;"

if [ $? -eq 0 ]; then
    echo -e "${GREEN}✅ Permissions set successfully!${NC}"
else
    echo -e "${YELLOW}⚠️  Permission setting had issues, but deployment may still work${NC}"
fi

# Check if Nginx is installed
echo -e "${YELLOW}🔍 Checking web server...${NC}"
sshpass -p "$SERVER_PASSWORD" ssh -o StrictHostKeyChecking=no $SERVER_USER@$SERVER_IP "command -v nginx &> /dev/null"

if [ $? -eq 0 ]; then
    # Test Nginx configuration
    echo -e "${YELLOW}🔍 Testing Nginx configuration...${NC}"
    sshpass -p "$SERVER_PASSWORD" ssh -o StrictHostKeyChecking=no $SERVER_USER@$SERVER_IP "sudo nginx -t" 2>/dev/null

    if [ $? -eq 0 ]; then
        echo -e "${GREEN}✅ Nginx configuration is valid!${NC}"
        
        # Reload Nginx
        echo -e "${YELLOW}🔄 Reloading Nginx...${NC}"
        sshpass -p "$SERVER_PASSWORD" ssh -o StrictHostKeyChecking=no $SERVER_USER@$SERVER_IP "sudo systemctl reload nginx" 2>/dev/null
        
        if [ $? -eq 0 ]; then
            echo -e "${GREEN}✅ Nginx reloaded successfully!${NC}"
        else
            echo -e "${YELLOW}⚠️  Could not reload Nginx (might need sudo privileges)${NC}"
        fi
    else
        echo -e "${YELLOW}⚠️  Nginx configuration test skipped (might need sudo privileges)${NC}"
    fi
else
    echo -e "${YELLOW}⚠️  Nginx not found. You may need to configure a web server manually.${NC}"
fi

# Display deployment info
echo ""
echo -e "${GREEN}🎉 Deployment completed successfully!${NC}"
echo "=================================="
echo -e "${BLUE}📂 App location: $APP_PATH${NC}"
echo -e "${BLUE}🌐 Local network: http://$SERVER_IP${NC}"
echo -e "${BLUE}📊 Check logs: sshpass -p '$SERVER_PASSWORD' ssh $SERVER_USER@$SERVER_IP 'tail -f /var/log/nginx/error.log'${NC}"
echo -e "${BLUE}💾 Backups: $BACKUP_PATH${NC}"
echo ""
echo -e "${YELLOW}📝 Next steps:${NC}"
echo "  1. Configure Nginx to serve files from $APP_PATH"
echo "  2. Set up domain/subdomain if needed"
echo "  3. Configure SSL certificate if needed"
echo ""
echo -e "${GREEN}✨ All done!${NC}"
