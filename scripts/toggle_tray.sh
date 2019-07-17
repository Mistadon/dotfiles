#!/bin/bash

if [ $(pgrep stalonetray) ]; then
    pkill stalonetray
else
    stalonetray &
fi
