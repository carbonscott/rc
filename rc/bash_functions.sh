# ============================================================================
# Directory shortcuts
# ============================================================================

# Show current working directory and copy the name of it ...
function pwdc {
    pwd
    pwd | tr -d '\n' | xclip -selection clipboard
}

# Open GUI from terminal ...
function o {
    open "$1" &> /dev/null
}

# ============================================================================
# File shortcuts
# ============================================================================

# Find shortcuts ...
function fi1 {
    find . -iname "*$1*"
}
