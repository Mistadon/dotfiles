#!/bin/sh
# relaunch DWM if the binary changes, otherwise bail
# also, log errors to a file
csum=$(sha1sum $(which dwm))
new_csum=""
while true
do
    if [ "$csum" != "$new_csum" ]
    then
        csum=$new_csum
        dwm 2> ~/.dwm.log
    else
        exit 0
    fi
    new_csum=$(sha1sum $(which dwm))
    sleep 1
done
