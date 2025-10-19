#!/bin/bash
# Firewall configuration using UFW (Uncomplicated Firewall)

sudo ufw default deny incoming
sudo ufw default allow outgoing

# Allow SSH on port 22
sudo ufw allow 22/tcp

# Allow HTTP/HTTPS if my server ever wants to host a web app
sudo ufw allow 80/tcp
sudo ufw allow 443/tcp

# Enable logging and firewall
sudo ufw logging on
sudo ufw --force enable

echo "UFW firewall configured and enabled."
