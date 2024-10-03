#!/bin/bash

# This script automates the WireGuard VPN setup process

# Step 1: Check for and install prerequisites
if ! [ -x "$(command -v ansible)" ]; then
  echo "Ansible not found! Running the prerequisites installation script..."
  bash install-prerequisites.sh
else
  echo "Ansible is already installed."
fi

# Step 2: Run the Ansible playbook
echo "Running the Ansible playbook to configure WireGuard..."
ansible-playbook -i inventory.ini playbook.yml

# Step 3: Output the client configuration
echo "WireGuard VPN setup is complete!"
echo "The client configuration file has been saved as 'client-wg.conf'."
echo "Copy this file to your local machine and use it to connect to the VPN."
