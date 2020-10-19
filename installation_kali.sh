#!/bin/sh

# This script will install a Kali Linux system according to my preferences

if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root!" 
   exit 1
fi

# Install aptitude
apt-get install aptitude -y

# Update the system
aptitude update -y
aptitude upgrade -y
aptitude autoremove -y

# ------------------ Install Sublime Text ------------------ #
# Source: https://www.sublimetext.com/docs/3/linux_repositories.html
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg
apt-key add -
apt-get install apt-transport-https
echo "deb https://download.sublimetext.com/ apt/stable/"
tee /etc/apt/sources.list.d/sublime-text.list
aptitude update -y
aptitude install sublime-text -y


# ------------------ Install simple modules ------------------ #
aptitude install git


# ------------------ Install xclip ------------------ #
aptitude install xclip


# ------------------ Install Python modules ------------------ #
pip install requests


