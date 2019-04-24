# Should save all the dot-files/etc to be readied to push to github

# themes
cp -v ~/Wallpapers/* ./res/
# dot-files
cp -v ~/.bash_profile .
cp -v ~/.xinitrc .
cp -v ~/.Xdefaults .
cp -v ~/.config/i3/config ./i3_config
cp -v ~/.config/ranger/rc.conf ./ranger_rc.conf
cp -v /etc/i3blocks.conf .
