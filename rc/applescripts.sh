function tl {
    osascript -e 'tell application "Terminal" to get name of every window'
}

function tn {
    osascript -e "tell application \"Terminal\" to every window whose name contains \"$1\""
}

# Go to a specific terminal window
function tg {
    osascript -e "tell application \"Terminal\"
        set wintext to (every window whose name contains \"$1\")
        set winitem to item 1 of wintext
        set frontmost of winitem to true
    end tell"
}

# Go to a specific terminal window and kill the current window
function tj {
    osascript -e "tell application \"Terminal\"
        set wintext to (every window whose name contains \"$1\")
        set winitem to item 1 of wintext
        set frontmost of winitem to true
    end tell"
    exit
}
