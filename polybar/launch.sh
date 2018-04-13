#!/bin/bash

#Kill all other processes
killall -q polybar
while pgrep -x polybar >/dev/null; do sleep 1; done

mapfile -t array </home/moritz/.screenlayout/screens

for i in "${array[@]}"
do
    echo $i
	MONITOR=$i polybar top &
done
