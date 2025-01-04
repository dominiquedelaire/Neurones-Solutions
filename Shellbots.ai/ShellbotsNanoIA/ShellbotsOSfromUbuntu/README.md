# On install Ubuntu 22.04.5 AMD64 and ARM versions (on Jetson Orin Nvidia or M2 M3 Max)
**First, set shellbots user to sudo group**
* connect as root user (Reboot, then key "Maj" to access recovery mode)
* In mode recovery, choose "Drop to root shell prompt"
* Then type : **sudo usermod -aG sudo shellbots**
* type : reboot

## Create shellbots structure : install_shellbots_structure.sh
```bash
# Create shellbots structure and configuration
#!/bin/bash

# System update
echo "System Update..."
sudo apt update && sudo apt upgrade -y

# Nemo installation, replace nautilus file management
echo "Installation of Nemo..."
sudo apt install nemo -y

# Update file association nemo instead of Nautilus
echo "Configuration of nemo to replace file management by default..."
xdg-mime default nemo.desktop inode/directory application/x-gnome-saved-search

# Block Nautilus to manage desktop
echo "Disabled nautilus..."
gsettings set org.gnome.desktop.background show-desktop-icons false

# Activate Nemo to manage desktop
echo "Activation of Nemo to manage desktop..."
nemo-desktop &

# Creation directory Shellbots in /usr/share
echo "Creating the 'shellbots' directory in /usr/share..."
sudo mkdir -p /usr/share/shellbots
echo "'shellbots' directory created successfully."

# Creation Subdirectory 'resources' in shellbots
echo "Creating the 'resources' subdirectory inside /usr/share/shellbots..."
sudo mkdir -p /usr/share/shellbots/resources
echo "'resources' subdirectory created successfully."

# Remove backgrounds image by default
echo "Removing all default background images from /usr/share/backgrounds..."
sudo rm -rf /usr/share/backgrounds/*
echo "All default background images have been removed."

# Remove applications from menu
echo "Removing specific apps and links not necessary..."
sudo apt remove --purge libreoffice* -y
sudo rm firefox.desktop
sudo rm libre*
sudo rm simple-scan.desktop
sudo rm -rf /usr/share/libreoffice
sudo rm -rf /etc/libreoffice
sudo apt remove --purge thunderbird -y
# install other apps and modules
sudo snap install chromium
sudo apt install plymouth plymouth-themes -y
sudo apt install python3-pip -y
sudo apt install gnome-shell-extensions

# End of script
echo "Configuration has been installed. Restart your session if necessary."
```
> **Execute chmod +x install_shellbots_structure.sh to make the file executable and ready to run.**
> **Once executed, copy all the files from the Resources" directory on GitHub to /usr/share/shellbots/resources**  

## Remove Sotfware
**by Ubuntu Software**
* AisleRiot Solitaire
* Cheese
* Firefox
* LibreOffice
* Mahjongg
* Mines
* Rhythmbox
* Shotwell
* Sudoku
* To-dos
* Videos

## Add Software
**by Ubunty Software**
* Visual Studio Code

## Remove Favorites from taskbar
* Help
* Ubuntu Software

## Update Settings
* Optional (English US language and qwerty keyboard by default) :
  * Add french language : Show Application > Language Support > Language Tab > Install / Remove languages > French > Apply (Logout or Reboot)
  * Add azerty keyboard : Settings > Keyboard > + > French (France) > French (Azerty) > Add > set in first position if you work with azerty keyb.
* Settings > Background > Add Picture > Select image "backgrounds-shellbots1920x1080_1.png or other background (4k or desired image) in usr/share/shellbots/resources/
* Settings > Appearance > Color > Purple
* Settings > Appearance > Style > Dark
* Settings > Appearance > Desktop Icons
  * Size (Small)
  * Position of new icones (Top Right)
  * Show Personnal Folder (Off) 
* Settings > Appearance > Dock
  * Auto-hide the Dock (Off)
  * Panel Mode (Off)
  * Icon size : 32
  * Position on screen : Bottom
  * Configure dock behavior : Show Trash (Off)
* Settings > Privacy >  File History & Trash > File History (Off)
* Settings > Power > Power Saving Options > Screen Blank (Never)
* Settings > Displays > Fractional Scaling (ON)
* In Gnome Extensions, set to ON features :
  * Extensions, Desktop Icons NG, Ubuntu Appindicators, Ubuntu Dock, User Themes (Settings) 
