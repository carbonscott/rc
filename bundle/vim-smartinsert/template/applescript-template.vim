template |print|
display dialog "____"
endtemplate

template |alert|
display alert "____"
endtemplate

template |n|
¬
____
endtemplate

template |tellapp|
tell application "____"
				____
end tell
endtemplate

template |goto-help|
tell application "____"
    activate
    windows where name contains "____"
    if result is not {} then set index of item 1 of result to 1
end tell
endtemplate

