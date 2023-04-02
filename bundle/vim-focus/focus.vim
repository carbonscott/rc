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

" Only supports vim 8.0 and above...
if v:version < 800
    finish
endif

let g:focus_mode_on = 0

let s:cpo_save = &cpo
set cpo&vim


" [[[ UTILITY ]]]
function! s:padding_window(panel_size, prefix_direction)
    " Do not list this buffer...
    setlocal nobuflisted

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
    " set fillchars+=vert:\
    set fillchars=

    " Show min infor in statusline
    " set statusline=%h
    set statusline=%F
endfunction


function! s:maps_nop()
    let winkeys = [ "h", "j", "k", "l", "w",
                  \ "q", "n", "c", "o", "p", "s",
                  \ "x", "b", "v", "n", "m", "t",
                  \ "r", "y", "u", "i", "r",
                  \  "<Up>", "<Down>", "<Left>", "<Right>" ]

    for k in winkeys
        execute 'nnoremap <c-w>'.k.' <nop>'
        execute 'nnoremap <c-w>'.toupper(k).' <nop>'
        execute 'nnoremap <c-w>'.'<c-'.k.'>'.' <nop>'
    endfor
endfunction


function! s:rand_str(num)
    let rand_list = []
    for i in range(a:num)
        " 26 char long, starting with 65 (=A in ascii)...
        let rand_list = rand_list + [rand() % 26 + 65]
    endfor

    let rand_str = join(map(rand_list, {_, val -> nr2char(val)}), '')

    return rand_str
endfunction


" [[[ MAIN ]]]
function! <SID>focus_toggle()
    " Toggle it off if focus mode is already on???
    if g:focus_mode_on
        if exists("t:win_left")   | call s:kill_win( t:win_left )   | endif
        if exists("t:win_right")  | call s:kill_win( t:win_right )  | endif
        if exists("t:win_top")    | call s:kill_win( t:win_top )    | endif
        if exists("t:win_bottom") | call s:kill_win( t:win_bottom ) | endif

        let g:focus_mode_on = !g:focus_mode_on
        redraw
        echom 'Focus mode is off...'

        return
    endif

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
    let adjusted_width = 1
    if panel_width <= 0
        redraw
        let warn_msg = printf('The window width is less than %s.', win_center_width)
        call s:color_echo( warn_msg, 'red' )
        let adjusted_width = 0
    endif

    " Short-circuit if win_height is not large enough to hold the center window...
    let adjusted_height = 1
    if panel_height <= 0
        redraw
        let warn_msg = printf('The window height is less than %s.', win_center_height)
        call s:color_echo( warn_msg, 'red' )
        let adjusted_height = 0
    endif

    " Fetch the current filename...
    let g:buffer_current     = expand('%') == '' ? s:rand_str(16) : expand('%')
    let l:buffer_placeholder = "." . g:buffer_current

    " Split windows...
    if adjusted_width == 1
        " ...Left
        " vertical topleft new
        let split_cmd = 'vertical topleft split ' . l:buffer_placeholder
        call execute(split_cmd)
        let t:win_left = s:padding_window(panel_width, "vertical")

        " ...Right
        " vertical botright new
        let split_cmd = 'vertical botright split ' . l:buffer_placeholder
        call execute(split_cmd)
        let t:win_right = s:padding_window(panel_width, "vertical")
    endif

    if adjusted_height == 1
        " ...Top
        " split new
        let split_cmd = 'split ' . l:buffer_placeholder
        call execute(split_cmd)
        let t:win_top = s:padding_window(panel_height, "")

        " ...Bottom
        " rightbelow split new
        let split_cmd = 'rightbelow split ' . l:buffer_placeholder
        call execute(split_cmd)
        let t:win_bottom = s:padding_window(panel_height, "")
    endif

    " Apply other transformation...
    if adjusted_width + adjusted_height > 0
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
        " setlocal nornu

        " Disable cursor jumping with navigation key...
        call s:maps_nop()

        let g:focus_mode_on = !g:focus_mode_on

        redraw
        echom 'Focus mode is on...'
    endif
endfunction


function! s:kill_win(win_id)
    " Go to the window to close...
    let is_ok = win_gotoid( a:win_id )

    " Delete the buffer of the window...
    if is_ok
        bdelete!
    endif
endfunction


" [[[ CUSTOMIZE COMMAND ]]]
command! -nargs=0 FocusToggle call <SID>focus_toggle()
nnoremap ZQ :qa!<cr>


" [[[ CUSTOMIZE SHORTCUT ]]]
nnoremap [F :call <SID>focus_toggle()<CR>

" [[[ GLOBAL API ]]]
function! g:ToggleFocus()
    call <SID>focus_toggle()
endfunction

" [[[ END ]]]
let &cpo = s:cpo_save
unlet s:cpo_save
finish
