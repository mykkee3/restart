# Should save all the dot-files/etc to be readied to push to github

# themes
cp -v ~/Wallpapers/* ./bin/Wallpapers/
cp -v ~/scripts/* ./bin/.scripts/

# dot-files
cp -v ~/.bash_profile ./bin/
cp -v ~/.bash_aliases ./bin/
cp -v ~/.vimrc ./bin/
cp -v ~/.xinitrc ./bin/
cp -v ~/.Xdefaults ./bin/
cp -v ~/.config/i3/config ./bin/i3_config
cp -v ~/.config/ranger/rc.conf ./bin/ranger_rc.conf
cp -v /etc/i3blocks.conf ./bin/
