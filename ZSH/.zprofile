#
# ~/.zprofile
#

[[ -f ~/.zshrc ]] && . ~/.zshrc

export XKB_DEFAULT_LAYOUT=de,de
export XKB_DEFAULT_VARIANT=us,
export XKB_DEFAULT_OPTIONS=grp:caps_toggle,


if [ -z "$DISPLAY" ] && [ -n "$XDG_VTNR" ] && [ "$XDG_VTNR" -eq 1 ]; then
    exec startx
fi

#if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]; then
#  exec sway
#  exit 0
#fi


