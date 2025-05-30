# Set up Data directory...
export DATA_ROOT=$HOME/OneDrive

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
source ~/.vim/rc/bash_alias.slac.sh

# Python executable path...
source ~/.vim/rc/bash_executable.slac.sh

# Add env for apps...
source ~/.vim/rc/bash_env.sh

# Set default editor...
export VISUAL="vim"
export EDITOR="vim"

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

##############
# Load plugins
##############
function load.plugins {
    source $HOME/.vim/rc/plugins/my.time.sh
    source $HOME/.vim/rc/plugins/my.capture.sh
    source $HOME/.vim/rc/plugins/my.notes.sh
    source $HOME/.vim/rc/plugins/my.projects.sh
    source $HOME/.vim/rc/plugins/my.relations.sh

    ## source $HOME/.vim/rc/plugins/my.tex.sh
    ## source $HOME/.vim/rc/plugins/my.paper.sh
    ## source $HOME/.vim/rc/plugins/my.labnotes.sh
    ## source $HOME/.vim/rc/plugins/my.todo.sh
    ## source $HOME/.vim/rc/plugins/my.meeting.sh

    source $HOME/.vim/rc/plugins/my.remote.sh
}
load.plugins


## ### BEGIN ATSAS Installer ###
## export ATSAS=/Users/cwang31/Dropbox/software/ATSAS
## export PATH=$PATH:$ATSAS/bin
## ### END ATSAS Installer ###

##
# Your previous /Users/cwang31/.bash_profile file was backed up as /Users/cwang31/.bash_profile.macports-saved_2020-11-15_at_21:43:57
##

# MacPorts Installer addition on 2020-11-15_at_21:43:57: adding an appropriate DISPLAY variable for use with MacPorts.
export DISPLAY=:0
# Finished adapting your DISPLAY environment variable for use with MacPorts.


## test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"

export S3DFDTN=s3dfdtn.slac.stanford.edu

# >>> conda initialize >>>
function conda.start {
    # !! Contents within this block are managed by 'conda init' !!
    __conda_setup="$('/Users/cwang31/.local/miniconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
    if [ $? -eq 0 ]; then
        eval "$__conda_setup"
    else
        if [ -f "/Users/cwang31/.local/miniconda3/etc/profile.d/conda.sh" ]; then
            . "/Users/cwang31/.local/miniconda3/etc/profile.d/conda.sh"
        else
            export PATH="/Users/cwang31/.local/miniconda3/bin:$PATH"
        fi
    fi
    unset __conda_setup
}

function conda.python {
    export PATH="/Users/cwang31/.local/miniconda3/bin:$PATH"
}

function conda.end {
    export PATH=`echo $PATH | sed "s_${HOME}/.local/miniconda3/bin:__g"`
    export PATH=`echo $PATH | sed "s_${HOME}/.local/miniconda3/condabin:__g"`
}

function conda.restart {
    conda.start
    conda activate $1
}
# <<< conda initialize <<<

function conda.ml-py3.9 {
    conda.start
    conda activate ml-py3.9
}

function slacproxy {
    ssh -C2qfTnN -D 8080 cwang31@jump.slac.stanford.edu
}

# pass
[[ -r "/opt/local/share/bash-completion/completions/pass" ]] && \
    source "/opt/local/share/bash-completion/completions/pass"


# Enable iterm2 shell...
function iterm2.shell {
    source $HOME/.iterm2_shell_integration.bash
}

# Homebrew stuff
export PATH="/opt/homebrew/bin:$PATH"
eval "$(/opt/homebrew/bin/brew shellenv)"
export PATH="/opt/homebrew/opt/node@18/bin:$PATH"

function nvm.start {
    export NVM_DIR="$HOME/.nvm"
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
    [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
}
