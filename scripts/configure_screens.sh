#!/bin/sh

$screenlayoutdir=$dotfiles/screenlayout/$(hostname)
# Read the currently connected screens and write them to ~/.screens
xrandr -q | grep "\ connected" | sed "s/ .*//" > /home/moritz/.screens

# Compares the currently connected screens with pre-defined templates in $screenlayoutdir
(cd $screenlayoutdir && exec find -mindepth 2 -maxdepth 2 -type f -iname screens -execdir bash -c 'cmp --silent ./screens $HOME/.screens && ./layout.sh' \;)
