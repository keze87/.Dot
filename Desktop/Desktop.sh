#!/bin/bash

dir=~/.Dot/Desktop
olddir=~/Dot_Old

### Home ###

cd $dir/Home/
files="compton.conf zshrc dpi.sh mouse.sh pop.sh conkyrc yt.sh"

mkdir $olddir/Home

for file in $files; do

	if [ -f ~/.$file ]; then

		mv ~/.$file $olddir/Home/

	fi

	ln -s $dir/Home/$file ~/.$file

done

### Config ###

folders="i3 mpv"

for folder in $folders; do

	mv ~/.config/$folder $olddir/
	ln -s $dir/$folder ~/.config/$folder

done
