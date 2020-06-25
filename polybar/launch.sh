#!/bin/bash

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch Polybar, using default config location ~/.config/polybar/config
for mon in $(xrandr -q | awk '/^[^\s]* connected / {print $1}'); do
	printf "Launching for monitor [%s]\n" $mon
	MONITOR=$mon polybar top &
done



echo "Polybar launched..."
