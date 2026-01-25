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

" [[[ COMPATIBILITY ]]]
if exists("loaded_Focus")
    finish
endif
let loaded_Focus = 1

if v:version < 800
    finish
endif

let s:cpo_save = &cpo
set cpo&vim

" [[[ CONFIGURATION ]]]
" Width/height can be absolute (80) or percentage ('85%')
let g:FOCUS_W = get(g:, 'FOCUS_W', 80)
let g:FOCUS_H = get(g:, 'FOCUS_H', '85%')

" [[[ UTILITY ]]]
" Parse size expression: absolute number or percentage string
function! s:relsz(expr, limit)
    if type(a:expr) == v:t_number
        return a:expr
    endif
    if a:expr !~ '%$'
        return str2nr(a:expr)
    endif
    return a:limit * str2nr(a:expr[:-2]) / 100
endfunction

function! s:get_color(group, attr)
    return synIDattr(synIDtrans(hlID(a:group)), a:attr)
endfunction

function! s:set_color(group, attr, color)
    let gui = has('gui_running') || has('termguicolors') && &termguicolors
    execute printf('hi %s %s%s=%s', a:group, gui ? 'gui' : 'cterm', a:attr, a:color)
endfunction

function! s:getenv(env)
    let cmd = 'echo $' . a:env
    let ret = system(cmd)
    let res = substitute(ret, '\n', '', 'g')
    return res == '' ? 'NONE' : res
endfunction

function! s:color_echo(info, color)
    execute printf('hi WarningColor ctermfg=%s', a:color)
    echohl WarningColor
    echon a:info
    echohl NONE
    hi clear WarningColor
endfunction

" [[[ RANDOM STRING ]]]
let s:LCG_MULTIPLIER = 1664525
let s:LCG_INCREMENT  = 1013904223
let s:LCG_MODULUS    = 4294967296
let s:seed = -1

function! s:init_seed()
    let s:seed = reltime()[1]
endfunction

function! s:rand()
    if s:seed == -1
        call s:init_seed()
    endif
    let s:seed = (s:LCG_MULTIPLIER * s:seed + s:LCG_INCREMENT) % s:LCG_MODULUS
    return s:seed
endfunction

function! s:rand_str(num)
    let rand_list = []
    for i in range(a:num)
        let rand_list = rand_list + [s:rand() % 26 + 65]
    endfor
    return join(map(rand_list, {_, val -> nr2char(val)}), '')
endfunction

" [[[ CORE FUNCTIONS ]]]
function! s:tranquilize()
    let color_items = ['VertSplit', 'StatusLine', 'StatusLineNC', 'SignColumn']
    let bg_color = s:getenv('BG_COLOR')
    let fg_color = bg_color == 'light' ? 'white' : 'black'
    for grp in color_items
        call s:set_color(grp, 'fg', fg_color)
        call s:set_color(grp, 'bg', 'NONE')
        call s:set_color(grp, '', 'NONE')
    endfor
endfunction

function! s:repel()
    " Bounce back if cursor enters a padding window
    if exists('t:focus_main_win') && win_getid() != t:focus_main_win
        let cur_win = win_getid()
        if (exists('t:win_left') && cur_win == t:win_left) ||
         \ (exists('t:win_right') && cur_win == t:win_right) ||
         \ (exists('t:win_top') && cur_win == t:win_top) ||
         \ (exists('t:win_bottom') && cur_win == t:win_bottom)
            call win_gotoid(t:focus_main_win)
        endif
    endif
endfunction

function! s:resize_pads()
    if !exists('t:focus_main_win')
        return
    endif

    let win_width = &columns
    let win_height = &lines - 1  " Account for command line
    let center_width = s:relsz(t:focus_width, win_width)
    let center_height = s:relsz(t:focus_height, win_height)
    let panel_width = (win_width - center_width) / 2
    let panel_height = (win_height - center_height) / 2

    if exists('t:win_left') && win_id2win(t:win_left) > 0
        call win_execute(t:win_left, 'vertical resize ' . max([1, panel_width]))
    endif
    if exists('t:win_right') && win_id2win(t:win_right) > 0
        call win_execute(t:win_right, 'vertical resize ' . max([1, panel_width]))
    endif
    if exists('t:win_top') && win_id2win(t:win_top) > 0
        call win_execute(t:win_top, 'resize ' . max([1, panel_height]))
    endif
    if exists('t:win_bottom') && win_id2win(t:win_bottom) > 0
        call win_execute(t:win_bottom, 'resize ' . max([1, panel_height]))
    endif
endfunction

function! s:padding_window(panel_size, prefix_direction)
    setlocal nobuflisted buftype=nofile bufhidden=wipe noswapfile
    setlocal nornu nonu nocursorline nocursorcolumn winfixwidth winfixheight
    setlocal statusline=\

    execute printf('%s resize %s', a:prefix_direction, a:panel_size)

    " Fill with empty lines
    let win_height = winheight(0) - line('$')
    if win_height > 0
        setlocal modifiable
        call append(0, repeat([''], win_height))
        normal! gg
        setlocal nomodifiable
    endif

    let win_id = win_getid()
    execute winnr('#') . 'wincmd w'
    return win_id
endfunction

function! s:kill_win(win_id)
    let is_ok = win_gotoid(a:win_id)
    if is_ok
        bdelete!
    endif
endfunction

function! s:save_settings()
    let t:focus_revert = {
        \ 'fillchars': &fillchars,
        \ 'statusline': &statusline,
        \ 'mouse': &mouse,
        \ 'number': &number,
        \ 'relativenumber': &relativenumber
        \ }
    let t:focus_cursor = [line('.'), col('.')]
endfunction

function! s:restore_settings()
    if exists('t:focus_revert')
        let &fillchars = t:focus_revert.fillchars
        let &statusline = t:focus_revert.statusline
        let &mouse = t:focus_revert.mouse
        let &number = t:focus_revert.number
        let &relativenumber = t:focus_revert.relativenumber
    endif
    if exists('t:focus_cursor')
        call cursor(t:focus_cursor[0], t:focus_cursor[1])
    endif
    " Restore colors by reloading colorscheme
    if exists('g:colors_name')
        execute 'colorscheme ' . g:colors_name
    endif
endfunction

function! s:setup_autocmds()
    augroup Focus
        autocmd!
        autocmd VimResized * call s:resize_pads()
        autocmd ColorScheme * call s:tranquilize()
        autocmd WinEnter * call s:repel()
    augroup END
endfunction

function! s:clear_autocmds()
    augroup Focus
        autocmd!
    augroup END
endfunction

" [[[ MAIN ]]]
function! s:focus_on()
    let win_width = winwidth(0)
    let win_height = winheight(0)

    " Store current dimensions (convert percentage to absolute for resizing)
    let t:focus_width = s:relsz(g:FOCUS_W, win_width)
    let t:focus_height = s:relsz(g:FOCUS_H, win_height)

    let panel_width = (win_width - t:focus_width) / 2
    let panel_height = (win_height - t:focus_height) / 2

    " Warn if window too small
    let can_width = 1
    let can_height = 1
    if panel_width <= 0
        call s:color_echo(printf('Window width is less than %s.', t:focus_width), 'red')
        let can_width = 0
    endif
    if panel_height <= 0
        call s:color_echo(printf('Window height is less than %s.', t:focus_height), 'red')
        let can_height = 0
    endif
    if !can_width && !can_height
        return
    endif

    " Save settings and cursor
    call s:save_settings()
    let t:focus_main_win = win_getid()

    " Generate placeholder buffer name
    let buffer_name = expand('%') == '' ? s:rand_str(16) : expand('%')
    let placeholder = '.' . buffer_name . '.' . s:rand_str(16)

    " Create padding windows
    if can_width
        execute 'vertical topleft split ' . placeholder
        let t:win_left = s:padding_window(panel_width, 'vertical')

        execute 'vertical botright split ' . placeholder
        let t:win_right = s:padding_window(panel_width, 'vertical')
    endif

    if can_height
        execute 'topleft split ' . placeholder
        let t:win_top = s:padding_window(panel_height, '')

        execute 'rightbelow split ' . placeholder
        let t:win_bottom = s:padding_window(panel_height, '')
    endif

    " Apply settings
    set fillchars=
    set statusline=%F
    setlocal mouse-=a
    setlocal nonumber norelativenumber

    " Apply colors and setup autocmds
    call s:tranquilize()
    call s:setup_autocmds()

    redraw
    echom 'Focus mode is on'
endfunction

function! s:focus_off()
    " Clear autocmds first
    call s:clear_autocmds()

    " Close padding windows
    if exists('t:win_left')   | call s:kill_win(t:win_left)   | endif
    if exists('t:win_right')  | call s:kill_win(t:win_right)  | endif
    if exists('t:win_top')    | call s:kill_win(t:win_top)    | endif
    if exists('t:win_bottom') | call s:kill_win(t:win_bottom) | endif

    " Restore settings
    call s:restore_settings()

    " Clean up tab variables
    unlet! t:win_left t:win_right t:win_top t:win_bottom
    unlet! t:focus_main_win t:focus_revert t:focus_cursor
    unlet! t:focus_width t:focus_height

    redraw
    echom 'Focus mode is off'
endfunction

function! s:focus_toggle()
    if exists('#Focus#VimResized')
        call s:focus_off()
    else
        call s:focus_on()
    endif
endfunction

" [[[ RESIZE FUNCTIONS ]]]
function! s:resize_width(delta)
    if !exists('t:focus_main_win')
        return
    endif
    let t:focus_width = t:focus_width + a:delta
    call s:resize_pads()
endfunction

function! s:resize_height(delta)
    if !exists('t:focus_main_win')
        return
    endif
    let t:focus_height = t:focus_height + a:delta
    call s:resize_pads()
endfunction

" [[[ COMMANDS AND MAPPINGS ]]]
command! -nargs=0 FocusToggle call s:focus_toggle()

nnoremap <silent> <leader>FF :call <SID>focus_toggle()<CR>
nnoremap <silent> <leader>Fh :<C-u>call <SID>resize_width(-5 * (v:count1))<CR>
nnoremap <silent> <leader>Fl :<C-u>call <SID>resize_width(5 * (v:count1))<CR>
nnoremap <silent> <leader>Fj :<C-u>call <SID>resize_height(-5 * (v:count1))<CR>
nnoremap <silent> <leader>Fk :<C-u>call <SID>resize_height(5 * (v:count1))<CR>

" [[[ GLOBAL API ]]]
function! g:ToggleFocus()
    call s:focus_toggle()
endfunction

" [[[ END ]]]
let &cpo = s:cpo_save
unlet s:cpo_save
