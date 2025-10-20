#Making sure the file permissions on sensitive files is secure
#Ensuring proper file permissions for sensitive files is important for system security. 
#This script checks and corrects permissions for important files like/etc/passwd and /etc/shadow.

#!/bin/bash
# Ensure /etc/passwd and /etc/shadow have correct permissions
sudo chmod 644 /etc/passwd
sudo chmod 000 /etc/shadow
# Check permissions
echo "Permissions for /etc/passwd:"
ls -l /etc/passwd
echo "Permissions for /etc/shadow:"
ls -l /etc/shadow
