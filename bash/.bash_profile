#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc
if [ -z "$DISPLAY" ] && [ -n "$XDG_VTNR" ] && [ "$XDG_VTNR" -eq 1 ]; then
    exec startx
fi

#if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]; then
#    exec sway
#fi
