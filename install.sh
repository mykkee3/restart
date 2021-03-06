#!/bin/sh

# -=-=-
# This is the system installation file for the current build of linux
#
# Desktop environment : i3-gaps i3blocks + compton
# File browser : ranger
#
# $TERM : urxvt
# $EDITOR : vim (sublime-text3)
# $BROWSER : google-chrome
#
# Bloatware:
# - obs-studio discord
# -=-=-


# -=-=- Startup Setup -=-=- #
#

echo
echo "setting up some things..."
echo

# install setup stuff
sudo update-grub
sudo apt-get update && sudo apt-get upgrade -y
sudo apt-get dist-upgrade -y


# -=-=- Main Install -=-=- #
#

echo
echo "-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-"
echo
echo "Starting Main Install"
echo
echo "-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-"
echo

# Install Ubuntu System
sudo sh sys/install_sys.sh

# Install I3 Desktop
sudo sh sys/install_i3.sh

# Install System Bloatware
sudo sh sys/install_bloat.sh

# push personal configs
sudo sh sys/push_current.sh


# -=-=- Clean-Up -=-=- #
#

sudo apt-get update && sudo apt-get upgrade -y
sudo apt-get dist-upgrade -y
sudo apt autoremove -y

# Network Setup
echo "To setup the network run:"
echo "\`nmcli d wifi connect Primus-32e6 password *passwd\`"
echo
echo "then consider rebooting..."

#reboot



# EOF
