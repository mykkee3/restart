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


# -=-=- Dependancies -=-=- #
#

echo
echo "installing system dependancies"
echo "installing i3-gaps dependancies"
echo

# i3-gaps dependancies
sudo apt-get install -y libxcb1-dev libxcb-keysyms1-dev libpango1.0-dev libxcb-util0-dev libxcb-icccm4-dev libyajl-dev libstartup-notification0-dev libxcb-randr0-dev libev-dev libxcb-cursor-dev libxcb-xinerama0-dev libxcb-xkb-dev libxkbcommon-dev libxkbcommon-x11-dev autoconf libxcb-xrm0 libxcb-xrm-dev automake libxcb-shape0-dev gcc xinit
# system dependancies
sudo apt-get install -y network-manager net-tools openssh-server alsa-utils zathura rxvt compton feh suckless-tools ranger vim
#ranger setup
ranger --copy-config=all

# special i3-gaps dependancy
sudo add-apt-repository ppa:aguignard/ppa
sudo apt-get update
sudo apt-get install -y libxcb-xrm-dev

# install status bar before i3 so it doesnt overwrite it
sudo apt-get install -y i3blocks
sudo apt-get purge -y i3-wm


# -=-=- installing i3-gaps -=-=- #
#

echo
echo "installing i3-gaps"
echo

# i3-gaps
cd /tmp
git clone https://www.github.com/Airblader/i3 i3-gaps
cd i3-gaps
git checkout gaps && git pull
autoreconf --force --install
rm -rf build
mkdir build
cd build
../configure --prefix=/usr --sysconfdir=/etc
make
sudo make install

# possable minimal system exitpoint
#exit 0
echo
echo "skipping minimal system exitpoint"
echo

# -=-=- Bloatware -=-=- #
#

echo
echo "installing system bloatware"
echo

# system bloatware
sudo apt-get install -y obs-studio ffmpeg
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

# push personal content
sudo sh push_current.sh

# Network Setup
echo "To setup the network run:"
echo "\`nmcli d wifi connect Primus-32e6 password *passwd\`"
echo
echo "then consider rebooting..."

#reboot
