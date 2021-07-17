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

