# Environment variables
export EDITOR='nvim'
export SSH_KEY_PATH="~/.ssh/rsa_id"

export LANG=en_GB.UTF-8
LANG=en_GB.UTF-8
LC_CTYPE=en_GB.UTF-8
LC_NUMERIC=en_GB.UTF-8
LC_TIME=en_GB.UTF-8
LC_COLLATE=en_GB.UTF-8
LC_MONETARY=en_GB.UTF-8
LC_MESSAGES=en_GB.UTF-8
LC_PAPER=en_GB.UTF-8
LC_NAME=en_GB.UTF-8
LC_ADDRESS=en_GB.UTF-8
LC_TELEPHONE=en_GB.UTF-8
LC_MEASUREMENT=en_GB.UTF-8
LC_IDENTIFICATION=en_GB.UTF-8


# Aliases
alias ls='ls --color=auto'
alias shutdown='shutdown now'
alias java='java -Dsun.java2d.uiScale=2'
alias pacaur='pacaur --ignore-ood'
alias jupyter='jupyter notebook'
alias tmux="tmux -2"

autoload -Uz compinit promptinit
compinit
promptinit

prompt walters

if [[ ! -o login ]]; then # Dont run cowsay if it's a login shell
    if [ "wlp4s0: connected to DoctorDickensIndustries" = "$(nmcli | grep 'DoctorDickensIndustries')" ]; then
        cowsay $(fortune -o)
    else
        cowsay $(fortune)
    fi
fi
