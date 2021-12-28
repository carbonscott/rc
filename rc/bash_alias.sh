# Set neovim as vi ...
alias vi="nvim "
## alias vi="vim "

# Typos ...
alias sl="ls "

# Shorter grep ...
alias gp="grep --color -e "
alias gpi="grep --color -i -e "
alias gpiv="grep --color -iv -e "

# Apply function on each item filtered by xargs ...
alias sargs="xargs -I {} -n 1 "

# Easier ls ...
alias lst="ls -lrt "

# Add u+x to a file...
alias x1="chmod u+x "

# Tmux related...
alias tls='tmux list-sessions'
alias tas='tmux attach-session -t '
alias tns='tmux new-session -s '

# more or less
alias m='more'
alias l='less'

# Go to example directory...
alias e='cd $HOME/Dropbox/codes/examples'

# Go to article directory...
alias a='cd $HOME/Dropbox/articles'

# Go to English directory...
alias n='cd $HOME/Dropbox/resources/English'

# Go to code directory...
alias c='cd $HOME/Dropbox/codes'

# Go to Dropbox directory...
alias d='cd $HOME/Dropbox'


# About using virtualenv for Python environment...
alias active="source ./venv/bin/activate"
