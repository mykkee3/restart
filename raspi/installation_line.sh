#!/bin/sh

echo
echo "================================="
echo
echo "Installing the i3-wm on raspberry-pi" 
echo
echo "================================="
echo

do_reboot=0;

echo "Do you want to rotate screen?"
echo

rotate_screen () {
	echo
	echo "0 : no rotation"
	echo "1 : 90 degrees cw"
	echo "2 : 180 degrees"
	echo "3 : 90 degreec ccw"
	echo 
	read -p "select an option: [0-3] " rot
	
	case $rot in
		[0-3]* ) sudo echo "\ndisplay_rotate=$rot" >> /boot/config.txt; echo "display_rotate$rot >> /boot/config.txt"; break;;
		* ) echo "Not a valid option!"; break;;
	esac

	#TODO: not perfect will append not replace
};

while true; do
    read -p "Do you want to rotate the screen? [y/n] " yn
    case $yn in
        [Yy]* ) do_reboot=1; rotate_screen; break;;
        [Nn]* ) break;;
        * ) echo "Please answer with [y/n]";;
    esac
done

while true; do
    read -p "Do you want to apply the \"raspi screen fix\"? [y/n] " yn
    case $yn in
        [Yy]* ) echo "Not made yet..."; break;;
        [Nn]* ) break;;
        * ) echo "Please answer with [y/n]";;
    esac
done

echo "Please set up network for installation to continue"
sleep 1

sudo raspi-config

echo
# add network check 

if [$do_reboot==1]; then
	reboot
fi

echo
echo "================================="
echo
echo "Downloading Installer"
echo

sudo apt-get install -y git
git clone https://github.com/mykkee3/restart.git
cd restart/

echo
echo "================================="
echo
echo "Running Installer"
echo
echo "================================="
echo

sudo sh raspi_install.sh
