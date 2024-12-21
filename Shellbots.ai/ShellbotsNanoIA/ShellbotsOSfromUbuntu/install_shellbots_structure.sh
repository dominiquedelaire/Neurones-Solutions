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

# End of script
echo "Nemo has been installed and configured as the default file manager. Restart your session if necessary."
