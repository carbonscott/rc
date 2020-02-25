function! quickman#man(man_command)
    " read command...
    let s:read = "0read !man ".a:man_command
    "let current_position = getpos(".")

    " remove <c-v><c-h>: character...
    let s:remove = "%s".
                 \ "/\\S".
                 \ "/".
                 \ "/g"

    " execute command...
    execute s:read

    " refresh screen...
    redraw

    " search test...
    let s:search = search("",)

    " substitute it only when command is correct...
    if s:search !=# 0 
        execute s:remove
    endif
    normal! gg
endfunction


function! quickman#perldoc(perldoc_cmd)
    " read command...
    let read = "0read !man ".a:perldoc_cmd

    " remove <c-v><c-h>: character...
    let remove = [ 
        \ "%s".
        \ "/\\v\\d\\[m".
        \ "/".
        \ "/g",
        \
        \ "%s".
        \ "/\\S".
        \ "/".
        \ "/g",
    \]

    " execute command...
    execute read

    " refresh screen...
    redraw

    " search test...
    let search = [search("\\v\\d\\[m",), search("",)]

    " substitute it only when command is correct...
    if search[0] !=# 0
        execute remove[0]
        redraw
    endif

    if search[1] !=# 0  
        execute remove[1]
        redraw
    endif
    normal! gg
endfunction


" cmd      opt         <cmd_name>    <function_called>
command!   -nargs=1    Man           call quickman#man(<q-args>)
command!   -nargs=1    Perldoc       call quickman#perldoc(<q-args>)

finish
