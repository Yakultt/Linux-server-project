#Enforcing Strong Password Policy
#Making sure users follow a strong password policy is necessary for system security. 
#This script will configure the system’s password policy to enforce strong passwords.

#!/bin/bash
# Install the libpam-pwquality package to configure password policies
sudo apt-get install libpam-pwquality -y
# Set password complexity requirements
sudo sed -i 's/# minlen = 8/minlen = 12/' /etc/security/pwquality.conf
sudo sed -i 's/# minclass = 1/minclass = 4/' /etc/security/pwquality.conf
# Enable password policy in PAM configuration
sudo echo "password requisite pam_pwquality.so retry=3" >> /etc/pam.d/common-password