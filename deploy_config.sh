#!/bin/bash

# Update .bashrc for root
echo 'export PS1="\[\e[31m\][\[\e[m\]\[\e[38;5;172m\]\u\[\e[m\]@\[\e[38;5;153m\]\h\[\e[m\] \[\e[38;5;214m\]\W\[\e[m\]\[\e[31m\]]\[\e[m\]\\$ "' >> /root/.bashrc

# Change the hostname
hostnamectl set-hostname k8s-worker01
bash

# Update SSH configuration
sed -i 's/#Port 22/Port 22/' /etc/ssh/sshd_config
sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config
systemctl reload sshd

# Update netplan configuration
cat <<EOF > /etc/netplan/00-installer-config.yaml
network:
  ethernets:
    enp0s3:
      addresses: [192.168.1.52/24]
      gateway4: 192.168.1.1
      nameservers:
        addresses: [10.202.10.202, 10.202.10.102]
  version: 2
EOF
netplan apply

echo "All configurations have been applied successfully."
