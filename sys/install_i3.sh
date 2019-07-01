#!/bin/sh

# -=-=-
# This is the i3 installer for my i3 system
#
# -=-=-

# -=-=- Dependancies -=-=- #
#

echo
echo "installing system dependancies"
echo "installing i3-gaps dependancies"
echo

# i3-gaps dependancies
sudo apt-get install -y libxcb1-dev libxcb-keysyms1-dev libpango1.0-dev libxcb-util0-dev libxcb-icccm4-dev libyajl-dev libstartup-notification0-dev libxcb-randr0-dev libev-dev libxcb-cursor-dev libxcb-xinerama0-dev libxcb-xkb-dev libxkbcommon-dev libxkbcommon-x11-dev autoconf libxcb-xrm0 libxcb-xrm-dev automake libxcb-shape0-dev gcc xinit

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
