#!/bin/sh

# Keyring
eval $(/usr/bin/gnome-keyring-daemon --start --components=pkcs11,secrets,ssh)
export SSH_AUTH_SOCK

# Autostart applications
stalonetray & # Systray
udiskie -s & # Udiskie, automounts thumb drives
/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 & # Graphical authentication agent
nextcloud & # Nextcloud
nm-applet & # Networkmanager
caffeine & # Caffeine

# Kill systray, it's annoying and can be started on demand. Only needs to start so I don't have a nextcloud popup
sleep 2 && pkill stalonetray &
