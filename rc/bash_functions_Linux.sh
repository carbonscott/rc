# [[[ Directory shortcuts ]]]

# Show current working directory and copy the name of it ...
function pwdc {
    pwd
    pwd | tr -d '\n' | xclip -selection clipboard
    ## pwd | tr -d '\n' | pbcopy
}

# Open GUI from terminal ...
function o {
    ## open "$1" &> /dev/null
    xdg-open "$1" &> /dev/null
}

# [[[ File shortcuts ]]]

# Find shortcuts ...
function fi1 {
    find . -iname "*$1*"
}


# [[[ Terminal ]]]
function clc {
    PROMPT_COMMAND=""
    echo -n -e "\033]0;$1\007"
}
alias clear='clear; clc '


# [[[ Vim ]]]
function vim_smart_colorscheme {
    # If $VIMCOLOR is empty...
    if [ -z "$VIMCOLOR" ]
    then 
        vim "$@"
    else
        vim --cmd "set bg=$VIMCOLOR" "$@"
    fi
}
alias vi='vim_smart_colorscheme'
