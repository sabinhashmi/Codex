sudo dnf install -y openssh-server

# Check SSH service status
sudo systemctl status sshd

# Start and enable SSH service at boot
sudo systemctl start sshd
sudo systemctl enable sshd

# Verify service is running
sudo systemctl status sshd

# Check firewall for SSH service
sudo firewall-cmd --list-all

# Allow SSH through firewall permanently
sudo firewall-cmd --permanent --add-service=ssh
sudo firewall-cmd --reload

# Connect via SSH
ssh username@fedora-ip-address
