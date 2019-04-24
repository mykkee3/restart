sudo update-grub
sudo apt-get -y update && sudo apt-get -y upgrade
sudo apt-get install -y git wget

# i3-gaps dependancies
sudo apt-get install -y libxcb1-dev libxcb-keysyms1-dev libpango1.0-dev libxcb-util0-dev libxcb-icccm4-dev libyajl-dev libstartup-notification0-dev libxcb-randr0-dev libev-dev libxcb-cursor-dev libxcb-xinerama0-dev libxcb-xkb-dev libxkbcommon-dev libxkbcommon-x11-dev autoconf libxcb-xrm0 libxcb-xrm-dev automake libxcb-shape0-dev gcc
# system dependancies
sudo apt-get install -y network-manager net-tools openssh-server alsa-utils zathura

# system bloatware
sudo apt-get install -y compton suckless-tools feh rxvt ranger obs-studio ffmpeg
# bloatware setup
ranger --copy-config=all

# special i3-gaps dependancy
sudo add-apt-repository ppa:aguignard/ppa
sudo apt-get update
sudo apt-get install -y libxcb-xrm-dev

# install status bar before i3 so it dowsnt overwrite it
sudo apt-get install -y i3blocks
sudo apt-get purge -y i3-wm

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

# Base system exitpoint
#exit 0

# deb installs
wget -O chrome.deb "https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb"
sudo dpkg -i chrome.deb
sudo apt install -f -y

wget -O discord.deb "https://dl.discordapp.net/apps/linux/0.0.9/discord-0.0.9.deb"
sudo dpkg -i discord.deb
sudo apt install -f -y

# themes and housekeeping
mkdir -v ~/Wallpapers
cp Wallpapers/* ~/Wallpapers/
mkdir -v ~/scripts
cp scripts/* ~/scripts/
mkdir -v ~/dev
mkdir -v ~/Music
mkdir -v ~/Videos
mkdir -v ~/Downloads
mkdir -v ~/Resources

# move dotfiles
cp -v .bash_profile ~/
cp -v .xinitrc ~/
cp -v .Xdefaults ~/
cp -v i3_config ~/.config/i3/config
cp -v ranger_rc.conf ~/.config/ranger/rc.conf
cp -v i3blocks.conf /etc/

# Network Setup
echo "To setup the network run:"
echo "\`nmcli d wifi connect Primus-32e6 password *passwd\`"
echo
echo "then consider rebooting..."

#reboot
