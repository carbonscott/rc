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

# add matlab support...
alias matlabno="matlab -nodesktop -nosplash "

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
alias twl="tmux list-windows "
alias twa="tmux select-window -t "
alias twf="tmux find-window -t "

# - resize pane
alias trpx="tmux resize-pane -x "
alias trpy="tmux resize-pane -y "
alias trpl="tmux resize-pane -L "
alias trpr="tmux resize-pane -R "
alias trpd="tmux resize-pane -D "
alias trpu="tmux resize-pane -U "

# xdg-open
alias o="xdg-open "

# vmd
alias vmdte="vmd -dispdev text -e "

# video editting
function 4to3 {
				input_filename=$(basename $1)
				filename="${input_filename%.*}"

				ffmpeg -i $input_filename -vn \
       -acodec libmp3lame -ac 2 -ab 160k -ar 48000 \
        $filename.mp3

} 

# tmux
alias tl="tmux list-sessions "
alias tn="tmux new -s "
alias td="tmux detach "
alias ta="tmux attach -t "

# tree
alias trl="tree -L 1 "
