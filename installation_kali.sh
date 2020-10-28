#!/bin/sh

# This script will install a Kali Linux system according to my preferences

if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root!" 
   exit 1
fi

# Update the system
apt-get update -y
apt-get upgrade -y
apt-get autoremove -y

# ------------------ Install Sublime Text ------------------ #
# Source: https://www.sublimetext.com/docs/3/linux_repositories.html
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
sudo apt-get install apt-transport-https
echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list
sudo apt-get update
sudo apt-get install sublime-text


# ------------------ Install simple modules ------------------ #
sudo apt-get install git gobuster remmina -y


# ------------------ Install xclip ------------------ #
apt-get install xclip
echo 'alias "cs=xclip -selection clipboard"' >> ~/.bashrc


# ------------------ Install Nextcloud ------------------ #
sudo add-apt-repository ppa:nextcloud-devs/client
sudo apt install nextcloud-desktop


# ------------------ Fix Metasploit ------------------ #
cd /usr/share/metasploit-framework
gem install bundler:1.17.3
bundle install
gem update --system

# ------------------ Install Python modules ------------------ #
pip install requests


