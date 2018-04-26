#!/bin/sh

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

# merge in defaults and keymaps

if [ -f $sysresources ]; then
    xrdb -merge $sysresources
fi

if [ -f $sysmodmap ]; then
    xmodmap $sysmodmap
fi

if [ -f "$userresources" ]; then
    xrdb -merge "$userresources"
fi

if [ -f $usermodmap ]; then
	xmodmap $usermodmap
fi

################
################
# My own stuff #
################
################

# Read the currently connected screens and write them to ~/.screenlayout/screens
xrandr -q | grep "\ connected" | sed "s/ .*//" > /home/moritz/.screenlayout/screens

# Bind keymap (de_us is modified) and change the cursor
setxkbmap -layout de,de -variant us, -option grp:caps_toggle
xsetroot -cursor_name left_ptr

# Compares the currently connected screens with pre-defined templates in ~/.screenlayout
(cd /home/moritz/.screenlayout && exec find -mindepth 2 -maxdepth 2 -type f -iname screens -execdir bash -c 'cmp --silent ./screens ../screens && ./layout.sh' \;)

# Finally execute i3
exec i3 --shmlog-size=26214400
#exec bspwm
