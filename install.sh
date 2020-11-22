#!/bin/sh

# run this function for files that go directily into the home directory
gohome() {
	ln -sf $PWD/$1 ~/
}

# run this function for files that go into the .config file
goconfig() {
	ln -sf $PWD/$1 ~/.config/
}


gohome .bashrc
gohome .profile
gohome .Xresources

goconfig bspwm
goconfig dunst
goconfig polybar
goconfig sxhkd
goconfig picom.conf
goconfig nvim
goconfig lf

#install fonts
cp -r $PWD/polybar/fonts/* ~/.local/share/fonts
