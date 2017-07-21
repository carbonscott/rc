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
