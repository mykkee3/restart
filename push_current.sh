
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
cp -v ./.bash_profile ~/
cp -v ./.xinitrc ~/
cp -v ./.Xdefaults ~/
cp -v ./i3_config ~/.config/i3/config
cp -v ./ranger_rc.conf ~/.config/ranger/rc.conf
cp -v ./i3blocks.conf /etc/
