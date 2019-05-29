function tn {
    osascript -e 'tell application "Terminal" to get name of every window'
}

function tc {
    osascript -e "tell application \"Terminal\" to every window whose name contains \"$1\""
}

function tg {
    osascript -e "tell application \"Terminal\" to set frontmost of window id $1 to true"
}
