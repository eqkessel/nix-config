#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'

# Autocompletion and prompt configuration
source $HOME/.bash/git-completion.bash

# PS1 variable setting moved into here
source $HOME/.bash/bash-prompt.sh

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/qynn/.conda/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/qynn/.conda/etc/profile.d/conda.sh" ]; then
        . "/home/qynn/.conda/etc/profile.d/conda.sh"
    else
        export PATH="/home/qynn/.conda/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<