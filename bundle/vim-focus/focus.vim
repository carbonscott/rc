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

if v:version < 704
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
    " type() == 0 means number (v:t_number requires Vim 8.0+)
    if type(a:expr) == 0
        return a:expr
    endif
    if a:expr !~ '%$'
        return str2nr(a:expr)
    endif
    return a:limit * str2nr(a:expr[:-2]) / 100
endfunction

" Parse named parameters from command args (e.g., "w=80 h=50%")
function! s:parse_focus_args(args)
    let result = {'w': '', 'h': ''}
    let w_match = matchstr(a:args, 'w=\zs[0-9]\+%\?')
    if w_match != ''
        let result.w = w_match
    endif
    let h_match = matchstr(a:args, 'h=\zs[0-9]\+%\?')
    if h_match != ''
        let result.h = h_match
    endif
    return result
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
    " Avoid lambda syntax for Vim 7.4 compatibility
    return join(map(rand_list, 'nr2char(v:val)'), '')
endfunction

" [[[ WINDOW HELPERS (Vim 7.4 compatible) ]]]
" Execute command in window containing buffer, then return
function! s:win_do(bufnr, cmd)
    let winnr = bufwinnr(a:bufnr)
    if winnr > 0
        let cur = winnr()
        execute winnr . 'wincmd w'
        execute a:cmd
        execute cur . 'wincmd w'
    endif
endfunction

" Close window containing buffer and delete the buffer
function! s:win_close(bufnr)
    let winnr = bufwinnr(a:bufnr)
    if winnr > 0
        execute winnr . 'wincmd w'
        bdelete!
    endif
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
    if exists('t:focus_main_buf')
        let cur = winnr()
        let main_winnr = bufwinnr(t:focus_main_buf)
        if cur != main_winnr
            if (exists('t:buf_left') && cur == bufwinnr(t:buf_left)) ||
             \ (exists('t:buf_right') && cur == bufwinnr(t:buf_right)) ||
             \ (exists('t:buf_top') && cur == bufwinnr(t:buf_top)) ||
             \ (exists('t:buf_bottom') && cur == bufwinnr(t:buf_bottom))
                execute main_winnr . 'wincmd w'
            endif
        endif
    endif
endfunction

function! s:resize_pads()
    if !exists('t:focus_main_buf')
        return
    endif

    let win_width = &columns
    let win_height = &lines - 1  " Account for command line
    let center_width = s:relsz(t:focus_width, win_width)
    let center_height = s:relsz(t:focus_height, win_height)
    let panel_width = (win_width - center_width) / 2
    let panel_height = (win_height - center_height) / 2

    if exists('t:buf_left')
        call s:win_do(t:buf_left, 'vertical resize ' . max([1, panel_width]))
    endif
    if exists('t:buf_right')
        call s:win_do(t:buf_right, 'vertical resize ' . max([1, panel_width]))
    endif
    if exists('t:buf_top')
        call s:win_do(t:buf_top, 'resize ' . max([1, panel_height]))
    endif
    if exists('t:buf_bottom')
        call s:win_do(t:buf_bottom, 'resize ' . max([1, panel_height]))
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

    let bufnr = bufnr('%')
    execute winnr('#') . 'wincmd w'
    return bufnr
endfunction


function! s:save_settings()
    let t:focus_revert = {
        \ 'fillchars': &fillchars,
        \ 'statusline': &statusline,
        \ 'mouse': &mouse,
        \ 'number': &number,
        \ 'relativenumber': &relativenumber,
        \ 'textwidth': &textwidth,
        \ 'colorcolumn_matches': []
        \ }
    let t:focus_cursor = [line('.'), col('.')]

    " Save and remove existing ColorColumn matches
    for m in getmatches()
        if m.group ==# 'ColorColumn'
            call add(t:focus_revert.colorcolumn_matches, m)
            call matchdelete(m.id)
        endif
    endfor
endfunction

function! s:restore_settings()
    if exists('t:focus_revert')
        let &fillchars = t:focus_revert.fillchars
        let &statusline = t:focus_revert.statusline
        let &mouse = t:focus_revert.mouse
        let &number = t:focus_revert.number
        let &relativenumber = t:focus_revert.relativenumber
        let &textwidth = t:focus_revert.textwidth

        " Restore ColorColumn matches
        if exists('t:focus_cc_match')
            silent! call matchdelete(t:focus_cc_match)
        endif
        for m in t:focus_revert.colorcolumn_matches
            call matchadd(m.group, m.pattern, m.priority)
        endfor
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
" Optional params: a:1 = width, a:2 = height (empty string means use default)
function! s:focus_on(...)
    let width = a:0 >= 1 && a:1 != '' ? a:1 : g:FOCUS_W
    let height = a:0 >= 2 && a:2 != '' ? a:2 : g:FOCUS_H

    let win_width = winwidth(0)
    let win_height = winheight(0)

    " Store current dimensions (convert percentage to absolute for resizing)
    let t:focus_width = s:relsz(width, win_width)
    let t:focus_height = s:relsz(height, win_height)

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
    let t:focus_main_buf = bufnr('%')

    " Add ColorColumn at width+1 to show line length limit
    let t:focus_cc_match = matchadd('ColorColumn', '\%' . (t:focus_width + 1) . 'v', 200)

    " Generate placeholder buffer name
    let buffer_name = expand('%') == '' ? s:rand_str(16) : expand('%')
    let placeholder = '.' . buffer_name . '.' . s:rand_str(16)

    " Create padding windows (store buffer numbers, not window numbers)
    if can_width
        execute 'vertical topleft split ' . placeholder
        let t:buf_left = s:padding_window(panel_width, 'vertical')

        execute 'vertical botright split ' . placeholder
        let t:buf_right = s:padding_window(panel_width, 'vertical')
    endif

    if can_height
        execute 'topleft split ' . placeholder
        let t:buf_top = s:padding_window(panel_height, '')

        execute 'rightbelow split ' . placeholder
        let t:buf_bottom = s:padding_window(panel_height, '')
    endif

    " Apply settings
    set fillchars=
    set statusline=%F
    setlocal mouse-=a
    setlocal nonumber norelativenumber
    set textwidth=0

    " Apply colors and setup autocmds
    call s:tranquilize()
    call s:setup_autocmds()

    redraw
    echom 'Focus mode is on'
endfunction

function! s:focus_off()
    " Clear autocmds first
    call s:clear_autocmds()

    " Close padding windows (using buffer numbers, order doesn't matter)
    if exists('t:buf_bottom') | call s:win_close(t:buf_bottom) | endif
    if exists('t:buf_top')    | call s:win_close(t:buf_top)    | endif
    if exists('t:buf_right')  | call s:win_close(t:buf_right)  | endif
    if exists('t:buf_left')   | call s:win_close(t:buf_left)   | endif

    " Restore settings
    call s:restore_settings()

    " Clean up tab variables
    unlet! t:buf_left t:buf_right t:buf_top t:buf_bottom
    unlet! t:focus_main_buf t:focus_revert t:focus_cursor
    unlet! t:focus_width t:focus_height t:focus_cc_match

    redraw
    echom 'Focus mode is off'
endfunction

" Main dispatcher: handles :Focus command with optional named params
function! s:focus(args)
    let is_active = exists('#Focus#VimResized')

    " No arguments: toggle mode
    if a:args == ''
        if is_active
            call s:focus_off()
        else
            call s:focus_on()
        endif
        return
    endif

    " Has arguments: parse and enter focus mode
    let params = s:parse_focus_args(a:args)

    " If already in focus mode, exit first then re-enter with new dimensions
    if is_active
        call s:focus_off()
    endif

    call s:focus_on(params.w, params.h)
endfunction

" [[[ COMMANDS AND MAPPINGS ]]]
" :Focus [w=WIDTH] [h=HEIGHT] - enter focus mode with optional dimensions
" :Focus (no args) - toggle focus mode
command! -nargs=* Focus call s:focus(<q-args>)

" Explicit exit command
command! -nargs=0 FocusOff call s:focus_off()

" Backwards compatibility
command! -nargs=0 FocusToggle call s:focus('')

nnoremap <silent> <leader>F :Focus<CR>

" [[[ GLOBAL API ]]]
function! g:ToggleFocus()
    call s:focus('')
endfunction

function! g:Focus(...)
    if a:0 == 0
        call s:focus('')
    else
        call s:focus(a:1)
    endif
endfunction

" [[[ END ]]]
let &cpo = s:cpo_save
unlet s:cpo_save
