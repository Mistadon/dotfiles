#!/bin/sh
if [ "$2" == "temporary" ]; then
    date +%s > /run/user/$(id -u)/tmp_status
fi
xsetroot -name " $1 "
