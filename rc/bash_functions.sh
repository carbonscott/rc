# [[[ Directory shortcuts ]]]
# Show current working directory and copy the name of it...
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
# Find shortcuts...
function fi1 {
    find . -iname "*$1*"
}


# [[[ String manipulation ]]]
# Lowercase all letters and repalce empty space with underscore in a string...
# Input: a string without quotation
function s2f {
    echo "$@" | tr '[:upper:]' '[:lower:]' | sed -e 's/ /_/g' | tr -d '\n'
}



# [[[ Terminal ]]]
function clc {
    echo -n -e "\033]0;$1\007"
}
alias clear='clear; clc '
