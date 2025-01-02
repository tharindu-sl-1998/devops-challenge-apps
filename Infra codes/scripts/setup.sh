#!/bin/bash

# Exit on any error
set -e

echo "Starting environment setup..."

# Update package list
sudo apt-get update

# Install Node.js and NPM
echo "Installing Node.js and NPM..."
curl -fsSL https://deb.nodesource.com/setup_16.x | sudo -E bash -
sudo apt-get install -y nodejs
node --version
npm --version

# Install Nginx
echo "Installing Nginx..."
sudo apt-get install -y nginx
sudo systemctl enable nginx
sudo systemctl start nginx

# Install Certbot
echo "Installing Certbot..."
sudo apt-get install -y certbot python3-certbot-nginx

# Create Nginx configuration for Web App
echo "Creating Nginx configuration for Web App..."
cat << EOF | sudo tee /etc/nginx/sites-available/webapp.tharindu.com
server {
    listen 80;
    server_name webapp.tharindu.com;

    location / {
        proxy_pass http://localhost:3000;
        proxy_http_version 1.1;
        proxy_set_header Upgrade \$http_upgrade;
        proxy_set_header Connection 'upgrade';
        proxy_set_header Host \$host;
        proxy_cache_bypass \$http_upgrade;
    }
}
EOF

# Create Nginx configuration for API
echo "Creating Nginx configuration for API..."
cat << EOF | sudo tee /etc/nginx/sites-available/api.tharindu.com
server {
    listen 80;
    server_name api.tharindu.com;

    location / {
        proxy_pass http://localhost:3001;
        proxy_http_version 1.1;
        proxy_set_header Upgrade \$http_upgrade;
        proxy_set_header Connection 'upgrade';
        proxy_set_header Host \$host;
        proxy_cache_bypass \$http_upgrade;
    }
}
EOF

# Enable the sites
echo "Enabling sites..."
sudo ln -sf /etc/nginx/sites-available/webapp.tharindu.com /etc/nginx/sites-enabled/
sudo ln -sf /etc/nginx/sites-available/api.tharindu.com /etc/nginx/sites-enabled/

# Remove default nginx site
sudo rm -f /etc/nginx/sites-enabled/default

# Test Nginx configuration
sudo nginx -t

# Restart Nginx
sudo systemctl restart nginx

# Setup SSL certificates
echo "Setting up SSL certificates..."
sudo certbot --nginx -d webapp.tharindu.com -d api.tharindu.com --non-interactive --agree-tos --email tharindu.sl.1998@gmail.com

echo "Environment setup completed successfully!" 