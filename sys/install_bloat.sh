#!/bin/sh

# -=-=-
# This is the bloatware installer for my i3 system
#
# Bloatware:
# - obs-studio
#
# deb installs:
# - chrome
# - discord
# - sublime
#
# -=-=- 

# -=-=- Bloatware -=-=- #
#

echo
echo "installing system bloatware"
echo

# system bloatware
sudo apt-get install -y obs-studio 
# to system ffmpeg
# bloatware setup
#


# -=-=- deb installs -=-=- #
#

echo
echo "installing .deb installs"
echo

#chrome
wget -O chrome.deb "https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb"
sudo dpkg -i chrome.deb
sudo apt install -f -y

#discord
wget -O discord.deb "https://dl.discordapp.net/apps/linux/0.0.9/discord-0.0.9.deb"
sudo dpkg -i discord.deb
sudo apt install -f -y

#sublime
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
sudo apt-get install apt-transport-https
echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list
sudo apt-get install sublime-text

rm -v *.deb


# -=-=- Closing Cleanup -=-=- #
#

echo
echo "cleaning up.."
echo

# some cleanup stuff
sudo apt-get update && sudo apt-get upgrade -y
sudo apt-get dist-upgrade -y
sudo apt autoremove -y

# EOF
