#!/bin/sh
pactl set-sink-volume 0 $1
date +%s > /run/user/$(id -u)/tmp_status
sh ~/git/dotfiles/scripts/set_status.sh "Set volume to $(pactl list sinks | grep -m 1 'Volume: ' | awk '{print $5}')"
