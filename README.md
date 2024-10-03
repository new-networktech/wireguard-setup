# WireGuard VPN Setup - One Click Installation

This repository helps you easily set up a **WireGuard VPN** server on your **Ubuntu cloud server** (one cloud provider) using **Ansible** and **bash scripts**. You only need to update your server IP address and run a single command to install and configure the VPN automatically.

## Prerequisites

Before proceeding, ensure you have the following:
- An **Ubuntu server** running in the cloud (e.g., from RackNerd, DigitalOcean, etc.).
- **SSH access** to your cloud server.
- Basic knowledge of how to edit text files (to update the server IP).

The setup script will automatically install all necessary tools like **git**, **ansible**, and any other dependencies using the `install-prerequisites.sh` script. You can first create a file name install-prerequisites.sh cpoy and past the content's from source file in Github to your Local machine, then this command will install all rerequisites: 

```bash
./install-prerequisites.sh
```

## Steps to Set Up WireGuard VPN

### 1. Clone This Repository

First, clone this GitHub repository to your local machine:

```bash
git clone https://github.com/yourusername/wireguard-setup.git
cd wireguard-setup
```
### 2. Update the Server IP
Open the inventory.ini file in the repository and replace <SERVER_IP> with your actual cloud server's IP address. You should also update the ansible_user with your SSH user (default is usually root for many cloud providers, but it can vary).
```
[vpn]
vpn_server ansible_host=<SERVER_IP> ansible_user=<SERVER_USER>
```
> Example of what the updated **inventory.ini** might look like:
```
[vpn]
vpn_server ansible_host=1.2.3.4 ansible_user=root
```

### 3. Run the Setup Script
After updating your server's IP in the inventory.ini file, you can now run the provided setup script. This script will:

+ Install Ansible on your local machine if it is not already installed.
+ Run the Ansible playbook that installs WireGuard on your cloud server.
+ Generate the WireGuard configuration files for both the server and the client.

**To run the script, simply execute:**
```
bash setup.sh
```
### 4. Copy the Client Configuration to Your Local Machine
```
scp root@<SERVER_IP>:/root/client-wg.conf .
```
Replace <SERVER_IP> with the IP of your server.
### 5. Connect to Your WireGuard VPN
Now that you have the client-wg.conf file on your local machine, you can use it to connect to the VPN. Here are the steps depending on your device:
#### On Linux:
1. Install WireGuard:
```
sudo apt install wireguard -y
```
2. Move the **client-wg.conf** file to **/etc/wireguard/**:
```
sudo mv client-wg.conf /etc/wireguard/
```
3. Start the VPN:
```
sudo wg-quick up client-wg.conf
```
#### macOS:
1. Install the WireGuard app from the official website: WireGuard for macOS.
2. Open the WireGuard app and import the client-wg.conf file.
3. Activate the VPN connection.

### On Android/iOS:
1. Install the WireGuard app from the App Store or Google Play Store.
2. Open the app, click Add, and then import the client-wg.conf file.
3. Activate the VPN connection.

### Troubleshooting
+ Permission issues on Ansible or WireGuard: Ensure that you have sudo permissions on your local machine and your cloud server.
+ Failed connection to server: Double-check that you have the correct SSH access and server IP configured in inventory.ini.
+ Client unable to connect: Ensure your server's firewall is not blocking WireGuard traffic (UDP port 51820). You can allow it with:

### How It Works
+ **Ansible Playbook:** The playbook installs WireGuard, generates the necessary keys, and configures the VPN on your cloud server.
+ **Bash Script:** The script ensures that Ansible is installed and runs the playbook, simplifying the process to just one command.
+ **Client Configuration:** After setting up the server, the playbook generates a client-wg.conf file which you use to connect your device to the VPN.

### Conclusion
With just a few simple steps, you now have a fully functional WireGuard VPN running on your cloud server. You can easily connect your devices to it and ensure that your internet traffic is secure.

### Additional Notes
This setup is designed for Ubuntu servers, so if you're using a different Linux distribution, some adjustments may be necessary.
Always keep your WireGuard server updated for the latest security patches.
### License
This project is licensed under the MIT License. Feel free to contribute and modify the setup for your own use!

