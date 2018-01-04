template |alert|
display alert "____"
endtemplate

template |n|
¬
____
endtemplate

template |tell|
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

template |comment|
(*
    ____
*)
endtemplate

template |set|
set ____ to ____
endtemplate

template |print|
display alert "____"
endtemplate

template |as|
as ____
endtemplate

template |str-concat|
____ & ____
endtemplate

template |list-concat|
____ & ____
endtemplate

template |list|
{____,____}
endtemplate

template |list-index|
item ____ of ____
endtemplate

template |list-range|
item ____ through ____ of ____
endtemplate

template |head|
#!/usr/bin/env osascript
endtemplate

template |system.preference|
tell application "System Preferences"
    activate
    reveal pane "com.apple.preference.$item:____"
end tell
endtemplate

template |keydown|
key down $key:____
endtemplate

template |keyup|
key up $key:____
endtemplate

template |click.button|
click button "$name_of_button:____" of window 1
endtemplate

template |if|
if ____ then
    ____
end if
endtemplate

template |if-elseif|
if ____ then
    ____
else if ____ then
    ____
end if
endtemplate

template |if-else|
if ____ then
    ____
else
    ____
end if
endtemplate

template |set|
set $var:____ to ____
endtemplate

template |get|
get $var
endtemplate

template |print|
log ____
endtemplate

template |shell|
(do shell script "____")
endtemplate
