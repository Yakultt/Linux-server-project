#!/bin/bash
# Firewall configuration using UFW (Uncomplicated Firewall)


# Allow SSH on port 6767 since i configured the user account jay to only listen on port 6767
#to try and mitigate attack surface cause everyone and their mama knows ssh listens on 22
sudo ufw allow 6767/tcp

#disallow any other port 
sudo ufw default deny incoming
sudo ufw default allow outgoing




# Enable logging and firewall
sudo ufw logging on
sudo ufw --force enable

echo "UFW firewall configured and enabled."
