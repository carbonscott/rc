# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
alias log="perl ~/.vim/perlscripts/log_choices.pl"
eval `perl -I ~/perl5/lib/perl5 -Mlocal::lib`
export MANPATH=$HOME/perl5/man:$MANPATH

# more path for executables
export PATH="$PATH:/opt/local/bin/"

# bashrc
alias sb="source ~/.bashrc"

# add more functions...
source ~/.vim/rc/ide_command.sh

# add wmctrl control...
alias wml="wmctrl -l "
alias wma="wmctrl -a "
alias wms="wmctrl -s "
alias wmr="wmctrl -r :ACTIVE: "
alias wmc="wmctrl -c "

# add shortcuts to ls command...
alias lsd="ls -d "
alias lst="ls -lrt "
alias lstd="ls -dlrt "
alias lsdt="ls -dlrt "
alias less="less -x1 "

# add keywords for all project files...
gppro="R-|L-|P-|B-|S-|I-|O-|D-"

# xargs shortcuts...
alias sargs="xargs -I it -n 1 "

# tmux shortcuts...
# - swap pane
alias tsp="tmux swap-pane -t "
alias tspu="tmux swap-pane -U "
alias tspd="tmux swap-pane -D "

# - resize pane
alias trpx="tmux resize-pane -x "
alias trpy="tmux resize-pane -y "
alias trpl="tmux resize-pane -L "
alias trpr="tmux resize-pane -R "
alias trpd="tmux resize-pane -D "
alias trpu="tmux resize-pane -U "

# rename vi to vim
alias vi="/usr/bin/vim"

# setup xclip
alias pbcopy="xclip -sel clip"

# PATH for external package...
if [ $PATH == *"/opt/anaconda2/bin"* ]
then
    export PATH=/opt/anaconda2/bin:$PATH
fi

# quick project
alias pocket="cd ~/Dropbox/20-Pockets"

# load quick directories...
source ~/.vim/rc/quick_directories
