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
    local char_title_start="\033]0;"
    local char_title_end="\007"
    local user_input="$@"
    echo -n -e "${char_title_start}${user_input}${char_title_end}"
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
        local char_title_start="\033]0;"
        local char_title_end="\007"
        local user_input="$SESSION"
        echo -n -e "${char_title_start}${user_input}${char_title_end}"

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
        local char_title_start="\033]0;"
        local char_title_end="\007"
        local user_input="$SESSION"
        echo -n -e "${char_title_start}${user_input}${char_title_end}"

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


function tns.main() {
    # Define the session name and the list of windows...
    local session_name="main"
    local windows=("time" "capture" "notes" "projects")
    local socket="00"
    local data_root=$DATA_ROOT

    # Change the title of the current terminal window...
    local char_title_start="\033]0;"
    local char_title_end="\007"
    local user_input="main"
    echo -n -e "${char_title_start}${user_input}${char_title_end}"

    # Start a new tmux session...
    tmux -L "$socket" new-session -d -s "$session_name"

    # Iterate over the window array...
    for i in "${!windows[@]}"; do
        local window="${windows[$i]}"

        if [ $i -eq 0 ]; then
            # Rename the first window and change directory...
            tmux -L "$socket" rename-window -t "${session_name}:0" "$window"
        else
            # Create new windows and change directory...
            tmux -L "$socket" new-window -t "$session_name" -n "$window"
        fi

        # Change to the directory with the same name as the window...
        tmux -L "$socket" send-keys -t "${session_name}:${window}" "cd ${data_root}/${window};clear" C-m
    done

    # Switch to the first window...
    tmux -L "$socket" select-window -t "${session_name}:${windows[0]}"

    # Attach to the tmux session...
    tmux -L "$socket" attach-session -t "$session_name"
}


# Files modified within last 24h
function find.24h {
    find . -mtime -24h -type f
}
