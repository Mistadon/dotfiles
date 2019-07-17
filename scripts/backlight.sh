#!/bin/bash
# There is a difference between the actual brightness of a screen (the power
# output) and the perceived brightness (the one we see). This script is supposed
# to compensate for this difference by applying the formula f(x) = x^2 / 100 to
# the actual brightness. This way, at lower brightness, there are more fine
# steps and at higher brightness, larger steps. This is much more close to the
# brightness humans perceive.
# This script introduces a slight lag when adjusting the brightness, but who
# cares?
# I might adjust the function at some point, but it is good for now.

# increases/decreases brightness (perceived) brightness
# $1 is current brightness, $1 is +/-5 or so
# In case of 0+5, adjust to 10, because otherwise the screen won't turn on

# associative array of brightness values (from (brightness in percent)^2/100)
declare -A values
values[0]=0
values[1]=1
values[2]=2
values[3]=3
values[4]=4
values[5]=6
values[6]=9
values[7]=12
values[8]=16
values[9]=20
values[10]=25
values[11]=30
values[12]=36
values[13]=42
values[14]=49
values[15]=56
values[16]=64
values[17]=72
values[18]=81
values[19]=90
values[20]=100

# Get current brightness index (of $1)
function getindex {
    for index in {1..20}; do
        if [ ${values[$index]} -ge $1 ]; then
            index=$index
            return
        fi
    done

}
function inc {
    if [ $index -lt 20 ]; then
        ((index = $index + 1))
    fi
}
function dec {
    if [ $index -gt 0 ]; then
        ((index = $index - 1))
    fi
}

getindex $(xbacklight -get)
$1
xbacklight -set ${values[$index]}
date +%s > /run/user/$(id -u)/tmp_status
sh ~/git/dotfiles/scripts/set_status.sh "Set brightness to ${values[$index]}"
