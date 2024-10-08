# WireGuard VPN Setup - One Click Installation

This repository helps you easily set up a **WireGuard VPN** server on your **Ubuntu cloud server** (one cloud provider) using **Ansible** and **bash scripts**. You only need to update your server IP address and run a single command to install and configure the VPN automatically.

## Prerequisites

Before proceeding, ensure you have the following:
- An **Ubuntu server** running in the cloud (e.g., from Cloud Provider).
- **SSH access** to your cloud server.
- Download **[WinSCP](https://winscp.net/download/WinSCP-6.3.5-Setup.exe/download)**  if you have Windows-OS 
- **[Wireguard-Client](https://download.wireguard.com/windows-client/)**

The setup script will automatically install all necessary tools like **git**, **ansible**, and any other dependencies using the `install-prerequisites.sh` script. You can first create a file name install-prerequisites.sh cpoy and past the content's from source file in Github to your Local machine, then this command will install all prerequisites: 

*You can easy use nano command to create the install-prerequisites.sh file.*

Make the  install-prerequisites.sh script **executable** (if not already):
```bash
chmod +x install-prerequisites.sh 
```

```bash
bash install-prerequisites.sh
```

### Steps to Set Up WireGuard VPN

#### 1. Clone This Repository

First, clone this GitHub repository to your local machine:

```bash
git clone https://github.com/new-networktech/wireguard-setup.git
cd wireguard-setup
```

#### 2. Run the Setup Script
Now you can now run the provided setup script. This script will:

+ Install Ansible on your local machine if it is not already installed.
+ Run the Ansible playbook that installs WireGuard on your cloud server.
+ Generate the WireGuard configuration files for both the server and the client.
*Make the  install-prerequisites.sh script **executable** (if not already):*
```bash
chmod +x setup.sh 
```
**To run the script, simply execute:**
```
bash setup.sh
```
#### 3.  **Download** the Client Configuration File: 
After the script completes, the client configuration file `client-wg.conf` will be saved in the `/root/` directory of the server. To use the VPN on your local machine, you need to download this file.
 #### For Windows Users:
1.  Download and Install **WinSCP**:
   + Download **WinSCP** from WinSCP Download Page.
   + Install and open the program

2. **Connect** to the Server:

+ In WinSCP, create a new session:

   * Host name: Your server's public IP address.
   * Username: `root`.
   * Password: Your server's root password (or use your SSH key if applicable).
   * Set the File protocol to `SCP`.

3. Download the **Client-Configuration** File:

   + After connecting to the server, navigate to the `/root/` directory on the right-hand side of the WinSCP window.
   + Locate the `client-wg.conf` file.
   + Drag and drop the file from the server to your local machine (for example, to the `Downloads` folder).
------------ 
> ### Setting Up WireGuard on Your Windows Machine
 1. **Download WireGuard for Windows:**
    * Go to the WireGuard website and download the WireGuard client for Windows.
    * Install WireGuard on your Windows machine.
2. **Import the Client Configuration:**
   * Open the WireGuard client.
   * Click on "Import Tunnel(s) from file" and select the `client-wg.conf` file you just downloaded from your server.
   * Save the configuration.
3. **Connect to the VPN:**
   * In the WireGuard client, select the newly imported configuration and click "Activate" to connect to the VPN.
4. **Verify Your VPN Connection:**
   * Once connected, go to https://whatismyipaddress.com/ and check if your IP address has changed. It should now display the public IP address of your WireGuard server, indicating that all your traffic is being routed through the VPN.
------------
> ### For macOS
1. **Download WireGuard for macOS:**
   + Go to the Mac App Store and search for WireGuard.
   + Download and install the app.
2. **Transfer the `client-wg.conf` File to Your Mac:**
   + You can transfer the configuration file using scp (similar to the Windows steps):
```
scp root@<YOUR_SERVER_IP>:/root/client-wg.conf ~/Downloads/
```

   + You can also use a tool like FileZilla or Cyberduck to download the file from your server to your local machine.
3. **Import the Client Configuration:**
   * Open the WireGuard app on your Mac.

   + Click "Import Tunnel(s) from file" and select the `client-wg.conf` file from your Downloads folder.
   + Save the configuration.
4. **Connect to the VPN:**
   + Select the newly imported configuration and click "Activate" to connect to the VPN.
5. **Verify Your VPN Connection:**
   + Once connected, go to https://whatismyipaddress.com/ and check if your IP address has changed.
------
> ### For iOS (iPhone/iPad):
1. **Download WireGuard for iOS:**
   + Download the WireGuard app from the Apple App Store on your iPhone or iPad.

2. **Transfer the `client-wg.conf` File:**
   + You can use email or any cloud service (e.g., iCloud, Google Drive, Dropbox) to transfer the client-wg.conf file from your server to your iOS device.
3. **Import the Client Configuration:** 
   + Open the WireGuard app on your iOS device.
   + Tap the "+" icon and choose "Import from file or archive".
   + Select the `client-wg.conf` file and import it.
4. **Connect to the VPN:**
   + Select the imported configuration and tap "Activate" to connect to the VPN.
5. **Verify Your VPN Connection:**
   + Once connected, go to https://whatismyipaddress.com/ on Safari and check if your IP address has changed.
-----
> ### For Android:
1. **Download WireGuard for Android:**
   + Download the WireGuard app from the Google Play Store.
2. **Transfer the `client-wg.conf` File:**
   + You can use email or any cloud service (e.g., Google Drive, Dropbox) to transfer the client-wg.conf file from your server to your Android device.
3. **Import the Client Configuration:**
   + Open the WireGuard app on your Android device.
   + Tap the "+" icon and choose "Import from file or archive".
   + Select the `client-wg.conf` file from your device.
4. **Connect to the VPN:**
   + Select the imported configuration and tap "Activate" to connect to 
5. **Verify Your VPN Connection:**
the VPN.
   + Once connected, go to https://whatismyipaddress.com/ in your browser and check if your IP address has changed.

*If you are going to uninstall all steps you can use this command :*

```
bash uninstall-wireguard.sh
```
---------

### Troubleshooting

+ If you're unable to connect, ensure that:
   * UDP port `51820` is open on your server.
   * You have entered the correct server IP address.
   * The client configuration file (`client-wg.conf`) is correct.
   * For any issues with downloading files from the server to Windows, verify that you can SSH into the server and that WinSCP is correctly configured.
   * *For any issues with downloading files from the server to your device, verify that your method of transferring files is properly configured (e.g., SCP, cloud services)*
----------------------

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

