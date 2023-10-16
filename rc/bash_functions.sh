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
    ## echo -n -e "\033]0;$1\007"
    echo -n -e "\033]0;$@\007"
}
alias clear='clear; clc '


# [[[ Password manager ]]]
function pbclear {
    pbcopy < /dev/null
}

function passcp {
    # Fetch password...
    pass $1 | tr -d '\n' | pbcopy

    passconents=`pbpaste`

    if ! [ -z "$passconents" ]
    then
        # Countdown...
        secs=$((10))
        while [ $secs -gt -1 ]; do
           printf "The password will be cleared in $secs\033[0K s.\r"
           sleep 1
           : $((secs--))
        done
    fi

    # Clean things up...
    pbcopy < /dev/null

    # Clean the message...
    printf "                                               \r"
    printf "The password has been cleared.\n"
}


# [[[ TMUX ]]]
function tns {
    SESSION=$1;
    SOCKET=${2:-default};
    if [ -n "$SESSION" ]; then
        tmux -L "$SOCKET" new-session -s "$SESSION";
    fi
}

function tls {
    SOCKET=${1:-default};
    tmux -L "$SOCKET" list-sessions;
}

function tas {
    SESSION=$1;
    SOCKET=${2:-default};
    if [ -n "$SESSION" ]; then
        tmux -L "$SOCKET" attach-session -t "$SESSION";
    fi
}


# Show all sockets used by tmux...
function tmux.show_sockets {
    lsof -U | grep '^tmux'
}


function tss {
    SOCKET=${1:-"00"};
    SAVE_PATH=${2:-"$HOME/tmux.history"}
    {
        echo "___/ $(hostname):$SOCKET \___"
        echo "$(date)"
        tmux -L "$SOCKET" list-sessions
    } >> $SAVE_PATH
}
