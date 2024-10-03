#!/bin/bash

# This script automates the WireGuard installation process

# Step 1: Update and install Ansible
echo "Updating system and installing Ansible..."
sudo apt update && sudo apt install -y ansible

# Step 2: Run the Ansible playbook
echo "Running the Ansible playbook to configure WireGuard..."
ansible-playbook -i inventory.ini playbook.yml

# Step 3: Output the client configuration
echo "WireGuard VPN setup is complete!"
echo "The client configuration file has been saved as 'client-wg.conf'."
echo "Copy this file to your local machine and use it to connect to the VPN."
