#!/bin/bash

# This script uninstalls WireGuard and deletes all related configuration files and keys

echo "Stopping WireGuard service..."
sudo systemctl stop wg-quick@wg0

echo "Disabling WireGuard service..."
sudo systemctl disable wg-quick@wg0

echo "Removing WireGuard configuration files..."
sudo rm -f /etc/wireguard/wg0.conf

# Optionally, remove any other configuration files in /etc/wireguard/
sudo rm -rf /etc/wireguard/

echo "Removing generated keys (if stored in root)..."
sudo rm -f /root/privatekey /root/publickey /root/client-privatekey /root/client-publickey

echo "Uninstalling WireGuard and tools..."
sudo apt remove --purge wireguard wireguard-tools -y

echo "Cleaning up unused packages..."
sudo apt autoremove -y
sudo apt clean

echo "WireGuard uninstalled and all files removed."

# Optional reboot prompt
read -p "Would you like to reboot the system now? (y/n): " answer
if [ "$answer" != "${answer#[Yy]}" ] ;then
    echo "Rebooting the system..."
    sudo reboot
else
    echo "Uninstallation complete. Please reboot manually if needed."
fi
