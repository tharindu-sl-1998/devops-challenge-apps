#!/bin/bash

# Exit on any error
set -e

# Configuration
REPO_URL="https://github.com/tharindu-sl-1998/devops-challenge-apps.git"
APP_DIR="/opt/wp-application"
WEBAPP_DIR="$APP_DIR/webapp"
API_DIR="$APP_DIR/api"

echo "Starting application deployment..."

# Create application directory if it doesn't exist
sudo mkdir -p $APP_DIR
sudo chown -R $USER:$USER $APP_DIR

# Clone or update repository
if [ -d "$APP_DIR/.git" ]; then
    echo "Updating existing repository..."
    cd $APP_DIR
    git pull origin main
else
    echo "Cloning repository..."
    git clone $REPO_URL $APP_DIR
fi

# Function to setup and start a Node.js application
setup_and_start_app() {
    local app_dir=$1
    local app_name=$2
    local port=$3

    echo "Setting up $app_name..."
    cd $app_dir

    # Install dependencies
    npm install

    # Build the application (if needed)
    if [ -f "package.json" ] && grep -q "build" "package.json"; then
        echo "Building $app_name..."
        npm run build
    fi

    # Create or update PM2 process
    if pm2 list | grep -q "$app_name"; then
        echo "Restarting $app_name..."
        pm2 restart $app_name
    else
        echo "Starting $app_name..."
        PORT=$port pm2 start npm --name "$app_name" -- start
    fi
}

# Install PM2 if not installed
if ! command -v pm2 &> /dev/null; then
    echo "Installing PM2..."
    sudo npm install -g pm2
fi

# Setup and start both applications
setup_and_start_app "$WEBAPP_DIR" "wp-webapp" 3000
setup_and_start_app "$API_DIR" "wp-api" 3001

# Save PM2 process list
pm2 save

# Setup PM2 startup script
pm2 startup

echo "Application deployment completed successfully!"

# Display status
pm2 status 