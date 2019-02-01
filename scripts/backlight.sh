#!/bin/sh
# There is a difference between the actual brightness of a screen (the power
# output) and the perceived brightness (the one we see). This script is supposed
# to compensate for this difference by applying the formula f(x) = x^2 / 100 to
# the actual brightness. This way, at lower brightness, there are more fine
# steps and at higher brightness, larger steps. This is much more close to the
# brightness humans perceive.
# This script introduces a slight lag when adjusting the brightness, but who
# cares?
# I might adjust the function at some point, but it is good for now.

# maps percentile brightness to perceived brightness
function map {
    echo "$1^2/100" | bc
}
function reversemap {
    echo "sqrt($1*100)" | bc
}

# increases/decreases brightness
# $1 is current brightness, $1 is +/-5 or so
# In case of 0+5, adjust to 10, because otherwise the screen won't turn on
function adjust {
    if [[ $1 == 0 && $2 == '+5' ]]
    then
        echo 10
    else

    	echo "$1$2" | bc
    fi
}

# get current brightness
brightness=$(reversemap $(xbacklight -get))

# adjust brightness
brightness=$(adjust $brightness $1)

# map brightness to function
brightness=$(map $brightness)

# set brightness
xbacklight -set $brightness
