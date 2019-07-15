#!/bin/sh

# -=-=-
#
# Raspberry-Pi automatic setup
#
# Notes:
# ======
#
# to download to new system:
#     `sudo apt-get git && git clone https://github.com/mykkee3/restart.git && cd restart/ && sudo sh raspi_install.sh`
#
# -=-=-

echo
echo "Setting up sone things"
echo

sudo apt-get update && sudo apt-get upgrade -y
sudo apt-get dist-upgrade -y

# -=-=- Bloat -=-=- #
#

echo
echo "Installing bloatware..."
echo

sudo apt-get install -y vim ranger ffmpeg
# Ranger Setup
ranger --copy-config=all


# -=-=- I3 Setup -=-=- #
#

echo
echo "Installing I3 and stuff ^v^"
echo

sudo apt-get install -y compton feh rxvt
sudo apt-get install -y xserver-xorg xinit
sudo apt-get install -y i3blocks i3 dmenu suckless-tools


# -=-=- Move files -=-=- #
#

echo
echo "Moving files"
echo

cp -v ./bin/.vimrc ~/
cp -v ./bin/bash_profile ~/
cp -v ./bin/Xdefaults ~/

cp -v ./raspi/.xinit.rc ~/
cp -v ./raspi/wallpaper.jpg ~/

sudo mkdir ~/.config/
sudo mkdir ~/.config/i3/

sudo cp -v ./bin/i3_config ~/.config/i3/config
sudo cp -v ./bin/i3blocks.conf /etc/


# -=-=- Manual Stuff -=-=- #
#

echo 
echo "Stupid manual stuff \n\tTvT"
echo

sudo raspi-config


# -=-=- Clean-Up -=-=- #
#

echo
echo "Claening up... \n\t^v^"
echo

sudo apt-get update && sudo apt-get upgrade -y
sudo apt-get dist-upgrade -y
sudo apt-get autoremove -y

# -=-=- Done -=- #

echo
echo "Done \nI think I'm going to reboot now\n\tGimmy just a sec...\n\n\t\t^v^"
echo

sleep 1
sudo reboot

# EOF
