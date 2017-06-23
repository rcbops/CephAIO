#!/bin/bash

# Install ansible 2.3

apt-get install software-properties-common
apt-add-repository ppa:ansible/ansible
apt-get update
apt-get install ansible

# Copy public key to self
cat /root/.ssh/id_rsa.pub >> /root/.ssh/authorized_keys

# Disable password entry
sed -i '/PasswordAuthentication yes/c\PasswordAuthentication no' /etc/ssh/sshd_config

echo "System Bootstrapped" 
