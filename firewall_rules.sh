#!/bin/bash
# Firewall configuration using UFW (Uncomplicated Firewall)

#this is for allowing ssh and http cause im going to use my server as a http server
#for serving my html files for my ctf blog post
sudo ufw allow OpenSSH
sudo ufw allow http
sudo ufw allwo https

#disallow any other port 
sudo ufw default deny incoming
sudo ufw default allow outgoing




# Enable logging and firewall
sudo ufw logging on
sudo ufw --force enable

echo "UFW firewall configured and enabled."
