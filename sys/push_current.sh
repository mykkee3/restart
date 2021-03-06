
# themes and housekeeping
mkdir -v ~/Wallpapers
cp ./bin/Wallpapers/* ~/Wallpapers/
mkdir -v ~/.scripts
cp ./bin/.scripts/* ~/.scripts/
mkdir -v ~/dev
mkdir -v ~/Music
mkdir -v ~/Videos
mkdir -v ~/Downloads

# move dotfiles
cp -v ./bin/.bash_profile ~/
cp -v ./bin/.bash_aliases ~/
cp -v ./bin/.vimrc ~/
cp -v ./bin/.xinitrc ~/
cp -v ./bin/.Xdefaults ~/
mkdir -v ~/.config/i3/
cp -v ./bin/i3_config ~/.config/i3/config
cp -v ./bin/ranger_rc.conf ~/.config/ranger/rc.conf
sudo cp -v ./bin/i3blocks.conf /etc/
