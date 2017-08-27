# make use of `ls`...
alias lst="ls -lrt "
alias lsd="ls -d "
alias lsdt="ls -dlrt"
alias lstd="ls -dlrt"

# + `ls` derivative...
alias lsjob="ls *JOB*"
alias lsdata="ls *DATA*"
alias lsutil="ls *UTIL*"


# make use of `find`...  
function qfind {

				# the * from terminal prompt will be evaluated before passing to the function...
				local filename=$1   
				if [ -z "$filename" ]
    then
								echo "[warning] No file has been specified..."
								return 1
    fi

				local directory=$2

				if [ -z "$directory" ]
    then
								local directory="."
    fi


				find "$directory" -iname "$filename"
}

# -`qfind` derivative...
alias findall='qfind '
alias findpdf='qfind "*pdf" '
alias findpl='qfind "*pl" '

# typo

alias sl="ls "

# make use of `tree`

alias tree1='tree -L 1'
alias tree2='tree -L 2'
alias treed1='tree -d -L 1'
alias treed2='tree -d -L 2'

# tag a file or directory...
function qtag {
				local filename=$1
				if [ -z "$filename" ]  # true if $filename is empty
    then
								echo "[warning] No file has been specified..."
								return 1
    fi
				if [ ! -e "$filename" ] # if $filename doesn't exist
    then
								echo "[warning] No file is found..."
								return 1
    fi

				local tag=$2
				if [ -z "$tag" ]      # true if $filename is empty
    then
								echo "[warning] No tag has been specified..."
								return 1
    fi

				mv $filename $tag"_"$filename
}

alias qtag="qtag "

# git

alias git-st="git status --untracked-files=no "
alias git-stu="git status"
alias git-l="git log -n 10 "
alias git-ln="git log -n "
alias git-s="git show "
alias git-sn="git show --name-only"
alias git-a="git add "
alias git-c="git commit "
alias git-cm="git commit -m "

# grep
alias gp="egrep --color "
alias gpi="egrep --color -i"
alias gpiv="egrep --color -iv"

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

# more tmux 
alias tbk="source ~/.vim/rc/tmux-notebook.sh"

# tree
alias trl="tree -L 1 "
