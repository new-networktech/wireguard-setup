#!/bin/bash

# This script automates the WireGuard VPN setup process directly on the server

# Step 1: Check for and install prerequisites
if ! [ -x "$(command -v ansible)" ]; then
  echo "Ansible not found! Running the prerequisites installation script..."
  bash install-prerequisites.sh
else
  echo "Ansible is already installed."
fi

# Step 2: Run the Ansible playbook locally (since we're already on the server)
echo "Running the Ansible playbook to configure WireGuard locally..."
if ansible-playbook playbook.yml; then
  echo "WireGuard VPN setup is complete!"
  echo "The client configuration file has been saved as 'client-wg.conf'."
  echo "You can now download it to your local machine to connect to the VPN."

  # Provide download instructions
  echo "To download the client configuration file, run the following command from your local machine:"
  echo "scp root@<SERVER_IP>:/root/client-wg.conf ."
else
  echo "An error occurred during the WireGuard setup. Please check the playbook output for details."
fi
