function! Goto_center()
    let s:win_width = winwidth(0)
    let s:win_height = winheight(0)
    
    let s:cursor_pos = getpos('.')
    let s:cursor_pos[2] = s:win_width/3

    let s:virtualedit = &virtualedit
    let &virtualedit = "all"

    call setpos('.',s:cursor_pos)
    execute "normal! i \<bs>"
    "// let &rnu = 0

    let &virtualedit = s:virtualedit
endfunction

command! -nargs=0 GotoCenter call Goto_center()

finish
