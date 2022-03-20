" Copyright (c) 2020 Cong Wang
" 
" MIT License
" 
" Permission is hereby granted, free of charge, to any person obtaining
" a copy of this software and associated documentation files (the
" "Software"), to deal in the Software without restriction, including
" without limitation the rights to use, copy, modify, merge, publish,
" distribute, sublicense, and/or sell copies of the Software, and to
" permit persons to whom the Software is furnished to do so, subject to
" the following conditions:
" 
" The above copyright notice and this permission notice shall be
" included in all copies or substantial portions of the Software.
" 
" THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
" EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
" MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
" NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
" LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
" OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
" WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

" [[[ COMPATIBLITY ]]]
" If already loaded, we're done...
if exists("loaded_Focus")
    finish
endif
let loaded_Focus = 1

let s:cpo_save = &cpo
set cpo&vim


" [[[ UTILITY ]]]
function! s:padding_window(panel_size, prefix_direction)
    " Create a padding to the left and move cursor back to previosu window...
    setlocal nornu

    " Set the width (with vertical prefix) or height...
    execute printf('%s resize %s', a:prefix_direction, a:panel_size)

    setlocal nomodifiable
    call s:fill_window_by_emptyline()

    " Get the window id...
    let win_id = win_getid()

    " Focus on the last window...
    execute winnr('#') . 'wincmd w'

    return win_id
endfunction

function! s:fill_window_by_emptyline()
    let win_height = winheight(0) - line('$')
    if win_height > 0
        setlocal modifiable
        call append(0, repeat([''], win_height))
        normal! gg
        setlocal nomodifiable
    endif
endfunction

function! s:get_color(group, attr)
  return synIDattr(synIDtrans(hlID(a:group)), a:attr)
endfunction

function! s:set_color(group, attr, color)
  let gui = has('gui_running') || has('termguicolors') && &termguicolors
  execute printf('hi %s %s%s=%s', a:group, gui ? 'gui' : 'cterm', a:attr, a:color)
endfunction

function! Getenv(env)
" Auto switch bg color...
" getenv() is not available in older version of vim
    let cmd = 'echo $' . a:env
    let ret = system(cmd)
    let res = substitute(ret, '\n', '', 'g')
    if  res == '' | let res = 'NONE' | endif
    return res
endfunction


function! s:color_echo(info, color)
    " This function is used to prompt the warning information!
    execute printf('hi WarningColor ctermfg = %s', a:color)
    execute 'echohl WarningColor'
    echon  a:info
    execute 'echohl NONE'
    execute 'hi clear WarningColor'
endfunction


function! s:setoff()
    " Vertical separator...
    set fillchars+=vert:\ 
endfunction


function! s:maps_nop()
    let winkeys = [ "h", "j", "k", "l" ]

    for k in winkeys
        execute 'nnoremap <c-w>'.k.' <nop>'
    endfor
endfunction




" [[[ MAIN ]]]
function! s:focus_on()
    " Compute the panel size...
    " The center window should have 90 characters long
    let win_center_width = 90
    let win_width = winwidth(0)
    let panel_width = ( win_width - win_center_width ) / 2

    " The center window should have 40 characters tall
    let win_center_height = 50
    let win_height = winheight(0)
    let panel_height = ( win_height - win_center_height ) / 2

    " Short-circuit if win_width is not large enough to hold the center window...
    if panel_width <= 0
        redraw
        let warn_msg = printf('The window width is less than %s.  No Focus mode is necessary.  ', win_center_width)
        call s:color_echo( warn_msg, 'red' )
        return
    endif

    " Short-circuit if win_width is not large enough to hold the center window...
    if panel_height <= 0
        redraw
        let warn_msg = printf('The window height is less than %s.  No Focus mode is necessary.  ', win_center_height)
        call s:color_echo( warn_msg, 'red' )
        return
    endif

    " Split windows...
    " ...Left
    vertical topleft new   
    let t:win_left = s:padding_window(panel_width, "vertical")

    " ...Right
    vertical botright new  
    let t:win_right = s:padding_window(panel_width, "vertical")

    " ...Top
    split new   
    let t:win_top = s:padding_window(panel_height, "")

    " ...Bottom
    rightbelow split new   
    let t:win_bottom = s:padding_window(panel_height, "")

    " Turn off settings...
    call s:setoff()

    " Set colors for the follow items...
    let s:color_items = [ 'VertSplit', 'StatusLine', 'StatusLineNC', 'SignColumn' ] 
    "                                                 ^^^^^^^^^^^^
    " StatueLine non-current window.........................:

    " Auto choose bg color based on the terminal setting...
    let g:BG_COLOR = Getenv('BG_COLOR')
    let s:fg_color = g:BG_COLOR == 'light' ? 'white' : 'black'
    for grp in s:color_items
        call s:set_color(grp, 'fg', s:fg_color)
        call s:set_color(grp, 'bg', 'NONE')
        call s:set_color(grp, ''  , 'NONE')    " Everything else
    endfor

    " Turn off mouse interaction...
    setlocal mouse-=a

    " Turn off relative number...
    setlocal nornu

    " Disable cursor jumping with navigation key...
    call s:maps_nop()

    redraw
    echom 'Focus mode is on...'
endfunction


function! s:kill_win(win_id)
    " Go to the window to close...
    call win_gotoid( a:win_id )

    " Delete the buffer of the window...
    bdelete!
endfunction


function! s:focus_off()
    call s:kill_win( t:win_left )
    call s:kill_win( t:win_right )
    call s:kill_win( t:win_top )
    call s:kill_win( t:win_bottom )
    redraw
    echom 'Focus mode is off...'
endfunction


" [[[ CUSTOMIZE COMMAND ]]]
command! -nargs=0 Focus call s:focus_on()
command! -nargs=0 FocusOff call s:focus_off()
nnoremap ZQ :qa!<cr>


" [[[ END ]]]
let &cpo = s:cpo_save
unlet s:cpo_save
finish
