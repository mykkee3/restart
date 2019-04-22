sudo update-grub
sudo apt-get -y update && sudo apt-get -y upgrade
sudo apt-get install -y git wget

sudo apt-get install -y libxcb-devel xcb-util-keysyms-devel xcb-util-devel xcb-util-wm-devel xcb-util-xrm-devel yajl-devel libXrandr-devel startup-notification-devel libev-devel xcb-util-cursor-devel libXinerama-devel libxkbcommon-devel libxkbcommon-x11-devel pcre-devel pango-devel git gcc automake

sudo add-apt-repository ppa:aguignard/ppa
sudo apt-get update
sudo apt-get install -y libxcb-xrm-dev

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

sudo apt-get install -y compton suckless-tools feh rxvt ranger obs-studio

wget "https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb"
sudo dpkg -i google-chrome-stable_current_amd64.deb
sudo apt install -f

mkdir ~/Wallpapers
cp res/ae188e318ffa2043fc04017447a73985.jpg ~/Wallpapers/
cp -v .bash_profile ~/
cp -v .xinitrc ~/
cp -v .Xdefaults ~/

nmcli d wifi connect Primus-32e6 password $1
