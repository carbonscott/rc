function tn {
    osascript -e 'tell application "Terminal" to get name of every window'
}

function tc {
    osascript -e "tell application \"Terminal\" to every window whose name contains \"$1\""
}

function tg {
    osascript -e "tell application \"Terminal\" to set frontmost of window id $1 to true"
}

function ttd {
    osascript -e 'tell application "Terminal" to set current settings of front window to settings set "Directory"'
}

function ttc {
    osascript -e 'tell application "Terminal" to set current settings of front window to settings set "Code Yellow"'
}

function ttwl {
    osascript -e 'tell application "Terminal" to set current settings of front window to settings set "Write Light"'
}

function ttwd {
    osascript -e 'tell application "Terminal" to set current settings of front window to settings set "Write Dark"'
}