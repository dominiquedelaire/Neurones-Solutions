On install Ubuntu 22.04.5 AMD64 and ARM versions (Jetson Orin Nvidia)

# Create shellbots structure
* Mise à jour du système : sudo apt update && sudo apt upgrade -y (enter)
* Installation de Nemo, gestionnaire de fichiers avec fonctions graphiques de root à la place de Nautilus :
  * sudo apt install nemo -y (enter)
  * Modifier l'association par défaut : xdg-mime default nemo.desktop inode/directory application/x-gnome-saved-search (enter)
  * Empêcher Nautilus de gérer le bureau : gsettings set org.gnome.desktop.background show-desktop-icons false (enter)
  * Activer Nemo pour gérer le bureau : nemo-desktop & (enter)




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
