#!/bin/sh

# run this function for files that go directily into the home directory
gohome() {
	ln -sfv $PWD/$1 ~/
}

# run this function for files that go into the .config file
goconfig() {
	ln -sfv $PWD/$1 ~/.config/
}

# run this function for files that go into the .local/bin file
gobin() {
	ln -sfv $PWD/$1 ~/.local/bin/
}

echo "This script will make symbolic links to all the dotfiles."
echo "Be sure to be cd-ed in the directory where the dotfiles repo resides (where this script is located ofc)\n"
echo "Type \"y\" if you do so we can continue"
read choice

if [ "$choice" = "y" ]
then
	gohome .bashrc
	gohome .profile
	gohome .Xresources
	gohome .doom.d

	goconfig bspwm
	goconfig dunst
	goconfig polybar
	goconfig rofi
	goconfig sxhkd
	goconfig picom.conf
	goconfig nvim
	goconfig ncmpcpp
	goconfig lf

	gobin bin/dmenukaomoji
	gobin bin/toggle

	#install fonts
	echo "Copying polybar fonts"
	cp -ruv $PWD/polybar/fonts/* ~/.local/share/fonts
fi

