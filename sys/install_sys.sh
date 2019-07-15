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
# - obs-studio ffmpeg discord
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
sudo apt-get install -y git wget # git is probably already installed but still

# system dependancies
sudo apt-get install -y network-manager net-tools openssh-server alsa-utils zathura rxvt compton feh suckless-tools ranger vim ffmpeg unzip
#ranger setup
ranger --copy-config=all


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
