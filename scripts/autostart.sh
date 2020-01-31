#!/bin/sh

# Keyring
eval $(/usr/bin/gnome-keyring-daemon --start --components=pkcs11,secrets,ssh)
export SSH_AUTH_SOCK

# Autostart applications (stalonetray-dependent)
$HOME/git/dotfiles/lemonbar/lemonbar &
sleep 0.5 && stalonetray --geometry 4x1-0+0 --grow-gravity SW --icon-gravity NE --icon-size 32 --sticky --transparent true --window-layer bottom &
sleep 0.5 && {
	udiskie -t & # Udiskie, automounts thumb drives
	nextcloud & # Nextcloud
	caffeine & # Caffeine
	nm-applet & # Networkmanager
}

/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 & # Graphical authentication agent
dunst & 

# Kill systray, it's annoying and can be started on demand. Only needs to start so I don't have a nextcloud popup
# sleep 2 && pkill stalonetray &
