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
sudo apt-get update --fix-missing
# Ranger Setup
ranger --copy-config=all

# -=- System stuff -=- #
sudo apt-get install -y jq unclutter

#chrome
wget -O chrome.deb "https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb"
sudo dpkg -i chrome.deb
sudo apt install -f -y



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

sudo cp -v ./bin/.vimrc /home/pi/
sudo cp -v ./bin/.bash_profile /home/pi/
sudo cp -v ./bin/.Xdefaults /home/pi/

sudo cp -v ./raspi/.xinit.rc /home/pi/
sudo cp -v ./raspi/wallpaper.jpg /home/pi/

#sudo mkdir /home/pi/.config/
#sudo mkdir /home/pi/.config/i3/

#sudo cp -v ./raspi/i3_config /home/pi/.config/i3/config
sudo cp -v ./bin/i3blocks.conf /etc/



# -=-=- Clean-Up -=-=- #
#

echo
echo "Claening up... \n\t^v^"
echo

sudo apt-get update --fix-missing -y && sudo apt-get upgrade -y
sudo apt-get dist-upgrade -y
sudo apt-get autoremove -y

# -=-=- Done -=- #

echo
echo "Done \nI think I'm going to reboot now\n\tGimmy just a sec...\n\n\t\t^v^"
echo

sleep 1
sudo reboot

# EOF
