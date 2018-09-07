# Adds ~/.local/bin to the PATH.
# This allows me to add some functionality to certain executables, such as a better scaling factor for java applications and spotify and different languages for certain applications (e.g. gnucash)
export PATH="/home/moritz/.local/bin:${PATH}"

# Environment variables
export EDITOR='emacs'
export SSH_KEY_PATH="~/.ssh/rsa_id"

# Aliases
alias ls='ls --color=auto'
alias shutdown='shutdown now'
alias java='java -Dsun.java2d.uiScale=2'
alias pacaur='pacaur --ignore-ood'
alias jupyter='jupyter notebook'
alias tmux="tmux -2"

# Compton
autoload -Uz compinit promptinit
compinit
promptinit

# ZSH theme
prompt walters

if [[ ! -o login ]]; then # Dont run cowsay if it's a login shell and only be offensive if at home (my wifi is DoctorDickensIndustries)
    if [ "wlp4s0: connected to DoctorDickensIndustries" = "$(nmcli | grep 'DoctorDickensIndustries')" ]; then
        cowsay $(fortune -o)
    else
        cowsay $(fortune)
    fi
fi
