# Source bash config...
alias sb="source ~/.bash_profile"
alias sbvi="vi ~/.bash_profile"

# Manage $PATH... 
export PATH="/opt/local/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
## export PATH="$HOME/Library/Python/2.7/bin:$PATH"

# Add bash functions...
source ~/.vim/rc/bash_functions.sh

# Add bash alias...
source ~/.vim/rc/bash_alias.sh

# Add directory shotcuts...
source ~/.vim/rc/quick_directories

# Python executable path...
source ~/.vim/rc/bash_executable.sh

# Add env for apps...
source ~/.vim/rc/bash_env.sh

# Set default editor...
export VISUAL="nvim"
export EDITOR="nvim"

# Applescript...
source ~/.vim/rc/applescripts.sh

# Set default look of bash...
export PS1='[\u@\h \W]\$ '

# For MacOS Catalina or later...
export BASH_SILENCE_DEPRECATION_WARNING=1
alias perl="perl5.28"

# Turn on CLI color...
if [[ $OSTYPE == 'darwin'* ]]; then
    export CLICOLOR=1
fi

## ### BEGIN ATSAS Installer ###
## export ATSAS=/Users/scott/Dropbox/software/ATSAS
## export PATH=$PATH:$ATSAS/bin
## ### END ATSAS Installer ###

##
# Your previous /Users/scott/.bash_profile file was backed up as /Users/scott/.bash_profile.macports-saved_2020-11-15_at_21:43:57
##

# MacPorts Installer addition on 2020-11-15_at_21:43:57: adding an appropriate DISPLAY variable for use with MacPorts.
export DISPLAY=:0
# Finished adapting your DISPLAY environment variable for use with MacPorts.


## test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"


# >>> conda initialize >>>
function conda.start {
    # !! Contents within this block are managed by 'conda init' !!
    __conda_setup="$('/Users/scott/.local/miniconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
    if [ $? -eq 0 ]; then
        eval "$__conda_setup"
    else
        if [ -f "/Users/scott/.local/miniconda3/etc/profile.d/conda.sh" ]; then
            . "/Users/scott/.local/miniconda3/etc/profile.d/conda.sh"
        else
            export PATH="/Users/scott/.local/miniconda3/bin:$PATH"
        fi
    fi
    unset __conda_setup
}

function conda.python {
    export PATH="/Users/scott/.local/miniconda3/bin:$PATH"
}

function conda.end {
    export PATH=`echo $PATH | sed "s_${HOME}/.local/miniconda3/bin:__g"`
    export PATH=`echo $PATH | sed "s_${HOME}/.local/miniconda3/condabin:__g"`
}
# <<< conda initialize <<<


# pass
[[ -r "/opt/local/share/bash-completion/completions/pass" ]] && \
    source "/opt/local/share/bash-completion/completions/pass"
