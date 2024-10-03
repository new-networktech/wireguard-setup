#!/bin/bash

# This script installs the necessary prerequisites for setting up WireGuard VPN

echo "Updating package lists..."
sudo apt update

echo "Installing Git..."
sudo apt install git -y

echo "Installing Ansible..."
sudo apt install ansible -y

echo "All prerequisites installed successfully!"
