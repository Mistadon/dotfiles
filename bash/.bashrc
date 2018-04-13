#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias shutdown='shutdown now'
alias java='java -Dsun.java2d.uiScale=2'
alias spotify='spotify --force-device-scale-factor=1.5'
alias gparted='sudo gparted'
alias grub-customizer='sudo grub-customizer'

export QT_AUTO_SCREEN_SCALE_FACTOR=1
export GDK_SCALE=1.9
export GDK_DPI_SCALE=1.2
PS1='[\u@\h \W]\$ '


cowsay $(fortune -o)
