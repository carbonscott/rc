# [[[ Directory shortcuts ]]]

# Show current working directory and copy the name of it ...
function pwdc {
    pwd
    #// pwd | tr -d '\n' | xclip -selection clipboard
    pwd | tr -d '\n' | pbcopy
}

# Open GUI from terminal ...
function o {
    open "$1" &> /dev/null
}

# [[[ File shortcuts ]]]

# Find shortcuts ...
function fi1 {
    find . -iname "*$1*"
}


# [[[ Terminal ]]]
function clc {
    echo -n -e "\033]0;$1\007"
}
alias clear='clear; clc '

# [[[ Utilities ]]]
# pandoc, markdown, and entr...
function pme {
    # Get the filename...
    filename=$1

    # Get the length of the filename...
    len_filename=${#filename}

    # Extract the filename without `.pdf` as postfix...
    prefix_filename=${filename:0:len_filename-3}

    # Execute the custom command based on the prefix_filename...
    echo $filename | entr pandoc -f markdown+smart -t latex $filename -s -o $prefix_filename.pdf --pdf-engine=pdflatex
}
