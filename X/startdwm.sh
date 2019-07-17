#!/bin/sh
# start DWM and log errors to a file
while true
do
    dwm 2> /run/user/$(id -u)/dwm.log
done
