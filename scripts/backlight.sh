#!/bin/sh
# There is a difference between the actual brightness of a screen (the power
# output) and the perceived brightness (the one we see). This script is supposed
# to compensate for this difference by applying the formula f(x) = x^2 / 100 to
# the actual brightness. This way, at lower brightness, there are more fine
# steps and at higher brightness, larger steps. This is much more close to the
# brightness humans perceive.


brightness=$(cat /sys/class/backlight/intel_backlight/brightness)
max_brightness=$(cat /sys/class/backlight/intel_backlight/max_brightness)
steps=20

function step_brightness {
	if [ $1 -gt 20 ]; then
		echo $max_brightness
	elif [ $1 -lt 0 ]; then
		echo 0
	else
		echo $(( ($max_brightness*$1/$steps)**2/$max_brightness ))
	fi
}

function set_brightness {
	echo $1 > /sys/class/backlight/intel_backlight/brightness
	echo "Set brightness to: $1"
}

function inc {
	for ((step=0; step<=steps; step++)); do
		if [ $(step_brightness $step) -gt $brightness ]; then
			set_brightness $(step_brightness $(( $step + ${1:-1} - 1)) )
			return
		fi
	done
}

function dec {
	for ((step=steps; step>=0; step--)); do
		if [ $(step_brightness $step) -lt $brightness ]; then
			set_brightness $(step_brightness $(( $step - ${1:-1} + 1)))
			return
		fi
	done
}
$@
notify-send "Set"
