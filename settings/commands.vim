" Time and date
function! TimeCurrent()
    let time_now = strftime("%X %b %d")
    execute "normal i" . time_now
endfunction

command! -nargs=0 TimeCurrent call TimeCurrent()




" Date
function! DateCurrent()
    let time_now = strftime("%A, %B %e, %Y")
    execute "normal i" . time_now
endfunction

command! -nargs=0 DateCurrent call DateCurrent()




" Text manipulation: remove spaces in a line that only contain spaces
function! Nospace()
    " Save the current cursor position...
    let s:pos_current = getpos('.')

    " Remove spaces...
    execute '%s/^\s\+$//g'

    " Put cursor back to its original position...
    call setpos('.', s:pos_current)
endfunction
command! -nargs=0 Nospace call Nospace()


" Toggle visual line navigation with <F2>
function! ToggleVisualNavigation()
    if exists('g:visual_navigation_enabled') && g:visual_navigation_enabled
        unmap j
        unmap k
        let g:visual_navigation_enabled = 0
        echo "Normal navigation enabled"
    else
        nnoremap j gj
        nnoremap k gk
        vnoremap j gj
        vnoremap k gk
        let g:visual_navigation_enabled = 1
        echo "Visual navigation enabled"
    endif
endfunction
command! -nargs=0 ToggleVisualNavigation call ToggleVisualNavigation()
