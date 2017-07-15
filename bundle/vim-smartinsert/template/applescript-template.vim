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


