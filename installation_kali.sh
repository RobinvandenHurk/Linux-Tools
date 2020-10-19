#!/bin/sh

# This script will install a Kali Linux system according to my preferences

if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root!" 
   exit 1
fi

# Update the system
apt-get update -y
apt-get upgrade -y

# ------------------ Install Sublime Text ------------------ #
# Source: https://www.sublimetext.com/docs/3/linux_repositories.html
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg
apt-key add -
apt-get install apt-transport-https
echo "deb https://download.sublimetext.com/ apt/stable/"
tee /etc/apt/sources.list.d/sublime-text.list
sudo apt-get update -y
sudo apt-get install sublime-text -y


# ------------------ Install Xclip ------------------ #
apt-get install xclip


# ------------------ Install Python modules ------------------ #
pip install requests


