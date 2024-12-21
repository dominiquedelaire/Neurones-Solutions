On install Ubuntu 22.04.5 AMD64 and ARM versions (Jetson Orin Nvidia)
# Create shellbots structure : install_shellbots_structure.sh
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

# End of script
echo "Nemo has been installed and configured as the default file manager. Restart your session if necessary."
```




# Remove Sotfware
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


# Add Software
**by Ubunty Software**
* Visual Studio Code

**by Terminal**
* Add sudo as group for shellbots : su - (enter) usermod -aG sudo shellbots (enter)
* Chromium (web) :  sudo snap install chromium (enter)

# Remove Favorites from taskbar
* ThunderBird Mail

# Update Settings
* Optional (English US language and qwerty keyboard by default) :
  * Add french language : Show Application > Language Support > Language Tab > Install / Remove languages > French > Apply
  * Add azerty keyboard : Settings > Keyboard > + > French (France) > French (Azerty) > Add > set in first position if you work with azerty keyb.
* Settings > Background > Add Picture > 
