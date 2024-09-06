# Bash prompt configuration

# Git bash prompt decorator configurations
GIT_PS1_SHOWDIRTYSTATE=1
GIT_PS1_SHOWSTASHSTATE=1
GIT_PS1_SHOWUNTRACKEDFILES=1
GIT_PS1_SHOWUPSTREAM="auto"
source $HOME/.bash/git-prompt.sh

# Exit status prompt decorator
exitstatus()
{
    if [[ $? == 0 ]]; then
        echo -e "\e[90m$?\e[0m"
    else
        echo -e "\e[91m$?\e[0m"
    fi
}

# Conda environment prompt decorator
condaenv()
{
    if [ ! -z "$CONDA_DEFAULT_ENV" ]; then
        echo -e " \e[3;33m($CONDA_DEFAULT_ENV)\e[0m"
    fi
}

# Print text at the right of the prompt
# rightprompt()
# {
#     formatted="${1//\\/}"
#     printf "%*b" $COLUMNS "\[\e[3;33m\]\! (\#)\[\e[0m\]"
#     printf "\n\n\n"
#     printf "%s/%s:%d" $COLUMNS "${formatted}" "${#formatted}"
#     # "\[$(tput sc; rightprompt "\[\e[3;33m\]\! (\#)\[\e[0m\]"; tput rc)\]"
# }

# Prompt string
PS1='$(exitstatus)$(condaenv) [\[\e[92m\]\u@\h \[\e[1;94m\]\w\[\e[0m]\] $(__git_ps1 "\[\e[93m\](%s)\[\e[0m\]")\n\$ '