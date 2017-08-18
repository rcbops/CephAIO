#!/bin/bash

# Install ansible 2.3

apt-get install software-properties-common
apt-add-repository ppa:ansible/ansible
apt-get update
apt-get install ansible

# Create a key-pair and copy public key to self
su - $USER -c "echo |ssh-keygen -t rsa"
cat /root/.ssh/id_rsa.pub >> /root/.ssh/authorized_keys

# Disable password entry
sed -i '/PasswordAuthentication yes/c\PasswordAuthentication no' /etc/ssh/sshd_config

echo "System Bootstrapped" 
