function! Goto_center()
    let s:win_width = winwidth(0)
    let s:win_height = winheight(0)

    let s:virtualedit = &virtualedit
    let &virtualedit = "all"

    call setpos('.',[0,0,s:win_width/3,0])
    execute "normal! i \<bs>"
    let &rnu = 0

    let &virtualedit = s:virtualedit
endfunction

command! -nargs=0 GotoCenter call Goto_center()

finish
