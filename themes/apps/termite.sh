#!/bin/bash

for NAME in ${!COLORS[@]}; do
	echo -e "$NAME=${COLORS[$NAME]}"
done | cat $XDG_CONFIG_HOME/termite/general.conf - > $XDG_CONFIG_HOME/termite/config

killall -USR1 termite
