#!/bin/sh

# Autostart applications
compton -b # Compositor
udiskie -s & # Udiskie, automounts thumb drives
/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 & # Graphical authentication agent
nextcloud & # Nextcloud
nm-applet & # Networkmanager
caffeine & # Caffeine
