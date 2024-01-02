# Set neovim as vi ...
## alias vi="nvim "
alias vi="vim "

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

## # Tmux related...
## alias tls='tmux list-sessions'
## alias tas='tmux attach-session -t '
## alias tns='tmux new-session -s '

# more or less
alias m='more'
alias l='less'

# Sync folder...
export SYNC_FOLDER='OneDrive\ -\ SLAC\ National\ Accelerator\ Laboratory'

# Go to example directory...
alias e="cd $HOME/$SYNC_FOLDER/codes/examples"

# Go to article directory...
alias q="cd $HOME/$SYNC_FOLDER/notes/quicknotes"

# Go to English directory...
alias n="cd $HOME/$SYNC_FOLDER/resources/English"

# Go to code directory...
alias c="cd $HOME/$SYNC_FOLDER/codes"

# Go to Dropbox directory...
alias d="cd $HOME/$SYNC_FOLDER"


# About using virtualenv for Python environment...
alias active="source ./venv/bin/activate"
