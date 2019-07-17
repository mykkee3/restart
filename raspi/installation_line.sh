#!/bin/sh

echo
echo "================================="
echo
echo "Installing the i3-wm on raspberry-pi" 
echo
echo "================================="
echo

echo "Please complete setup:"
echo "\t-Password\n\t-network\n\t-boot options"
echo
sleep 3

sudo raspi-config

echo
# add network check 


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
