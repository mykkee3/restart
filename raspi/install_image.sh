#!/bin/sh

# -=-=- 
#
# Header
#
# -=-=-

echo
echo "==========================="
echo
echo "Starting the Raspberry-Pi installation"
echo
echo "==========================="
echo

echo "Password is required for installation..."
sudo true

echo
echo "First a disk must be selected"

sleep 1;

disk=$(lsblk -l | awk '!/sda|sr.|sd.[0-9]/{if (NR!=1) {print $1, $4} }' | dmenu -l 6 -p "Seleck a Disk" | awk '{print $1}');

img_path=~/Downloads/

infile=$(grep -rl .*\.img $img_path | awk '/.img/{print $0}' | dmenu -l 6 -p "Select an Image");

echo
echo "Selected disk: $disk"
echo "Selected image: $infile" #TODO: display shorter
echo

#run check on $disk and $infile
 
echo "==========================="
echo

# unmount disk

lsblk -l | awk "/$disk/"'{print "/dev/" $1}' | xargs -n1 sudo umount -v

resp=$(lsblk -l | awk "/$disk/"'{if ($7!="") {print $1}}');

if [ ! -z "$resp" ]; then
	echo
	echo "$resp" | awk '{print $0, "was not unmounted properly."}'
	echo Installation not complete, exiting early.
	exit 0;
fi

echo 
echo "==========================="
echo
echo "Writing to disk"
echo

sudo dd bs=4M if=$infile of=$disk status=progress conv=fsync

#TODO: do checks on conpletion stuff

echo 
echo "==========================="
echo
echo "Changing OS stuff"
echo
echo "==========================="
echo

# mount usb

mnt_disk=/dev/"$disk"2

sudo mkdir -v /mnt/raspi-disk/
sudo mount -v $mnt_disk /mnt/raspi-disk/

echo

lsblk

echo
echo "==========================="
echo

# add installer
sudo cp -v .bash_profile /mnt/raspi-disk/home/pi/
sudo cp -v installation_line.sh /mnt/raspi-disk/home/pi/

echo
sudo umount -v $mnt_disk

echo
echo "==========================="
echo
echo "\tDone!\t\t^v^"
echo
echo "==========================="
echo
# boot pi as vertual box

# EOF
