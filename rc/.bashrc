# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]
then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions

# Source bash config...
alias sb="source ~/.bash_profile"
alias sbvi="vi ~/.bash_profile"

# Manage $PATH... 
export PATH="/opt/local/bin:$PATH"

# Add bash functions...
source ~/.vim/rc/bash_functions_Linux.sh

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
