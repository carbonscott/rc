"key mapping: ->
noremap <F9> :set hlsearch<CR>
noremap <F10> :set nohlsearch<CR>

"tab
noremap [n :tabn<CR>
noremap [p :tabp<CR>
noremap <F7> :set list<CR>
noremap <F8> :set nolist<CR>

" buffer next, previous
noremap <F4> :ls<CR>:buffer 
nnoremap <F2> :hide bp<CR>
nnoremap <F3> :hide bn<CR>
nnoremap [vw bve

"======= map 0 and $ =====
nnoremap <s-h> g^
vnoremap <s-h> g^
sunmap <s-h>
nnoremap <s-l> g_
vnoremap <s-l> g_
sunmap <s-l>

"navigate escalted
nnoremap <c-j> 2j
nnoremap <c-k> 2k
vnoremap <c-j> 2j
vnoremap <c-k> 2k

" "delete buffer
" nnoremap <silent> [bd :bd<CR>

"close files
nnoremap <silent> [bx :q<CR>

"next/prev buffer
nnoremap <silent> [bn :bn<CR>
nnoremap <silent> [bp :bp<CR>

"resize window
nnoremap <silent> <c-right> :vertical resize +2<CR>
nnoremap <silent> <c-left> :vertical resize -2<CR>
nnoremap <silent> <c-down> :resize -2<CR>
nnoremap <silent> <c-up> :resize +2<CR>

"underline a single line
nnoremap <silent> [ul yypv0$r-

" map when insert
inoremap <c-h> <ESC>i
"inoremap <c-a> <c-o>a
inoremap <c-g> <c-k>
inoremap <F7> <c-o>:set list<CR>
inoremap <F8> <c-o>:set nolist<CR>
inoremap <c-j> <c-o>j
inoremap <c-k> <c-o>k
inoremap <c-l> <c-o>a
"inoremap <c-R> <c-o>e
inoremap <c-f> <c-o>e<c-o>a
inoremap <c-e> <c-o>b

"======= cmd navigation =======
cnoremap <c-h> <left>
cnoremap <c-l> <right>

"======= map 0 and $ =====
"nnoremap <s-h> 0
"vnoremap <s-h> 0
"nnoremap <s-l> $
"vnoremap <s-l> $
" nnoremap <c-k> zz
" nnoremap <c-l> zt
" nnoremap <c-j> zb

"====== treat <> as paired brackets =======
set matchpairs+=<:>

"BuffersToggle
" nnoremap [bb :BuffersToggle<CR>
"======= own develop ======
"set runtimepath+=~/.vim/bundle/vim-quote
set cursorline
"noh mapped by keystrokes
"nnoremap [o :noh<CR>
"nnoremap [mk :set hlsearch<CR>
"nnoremap [mj :set nohlsearch<CR>
"save file
nnoremap <silent> <c-m> :update<CR>
" nnoremap <c-q> :q<CR>
"map the folder key
nnoremap + zf
vnoremap + zf
nnoremap = zo
nnoremap - zc
nnoremap _ zd
vnoremap _ zd
sunmap _

"show file info
nnoremap <f5> :!./%<CR>

"rebind the number from 6 to 0 to be reached from <c-1> to <c-5> {
nnoremap [1 6
nnoremap [2 7
nnoremap [3 8
nnoremap [4 9
nnoremap [5 0
vnoremap [1 6
vnoremap [2 7
vnoremap [3 8
vnoremap [4 9
vnoremap [5 0
"}

" remap increment due to tmux prefix key 
"nnoremap <c-b> <c-a>

nnoremap [vm :mkview<CR>
nnoremap [vl :loadview<CR>

" highlight lines
hi CurrentStep ctermfg=White
nnoremap <silent> [hh :let map_current = matchaddpos('CurrentStep',[line('.')])<CR>
vnoremap <silent> [hv :<c-u>let map_current = matchaddpos("CurrentStep", 
\[[
\  line('.'),
\  getpos("'<")[2],
\  getpos("'>")[2] + 1 - getpos("'<")[2]
\]]
\)<CR>

" nnoremap [hr :echo getmatches()<CR>

nnoremap [hr :let items=getmatches() <bar> for item in items <bar> echo item <bar> endfor <CR>

nnoremap <silent> [hd :call matchdelete(map_current)<CR>
nmap <silent> [hs j:<c-u>call matchdelete(map_current)<CR>[hh
nmap <silent> [hb k:<c-u>call matchdelete(map_current)<CR>[hh
nmap <silent> [hk :<c-u>call matchdelete(map_current)<CR>[hh
nnoremap [hm :call matchdelete()<Left>

" quick double space...
inoremap {} {}<Left>
inoremap () ()<Left>
inoremap [] []<Left>
inoremap <lt>> <lt>><Left>
inoremap <Bar><Bar> <Bar><Bar><Left>

" quote...
inoremap "" ""<Left>
inoremap '' ''<Left>
inoremap `` ``<Left>

cnoremap "" ""<Left>
cnoremap '' ''<Left>
cnoremap `` ``<Left>
cnoremap () ()<Left>
cnoremap [] []<Left>
cnoremap <> <><Left>
cnoremap {} {}<Left>

" speical letter
inoremap [vv ^

" adding whitespace by number
nnoremap <silent> [<space> i<space><esc>

" enable the todo list custom highlighting...
let g:todo_done_switch = 0
nnoremap <silent> [t :source ~/.vim/syntax/custom_highlight.vim<CR>

" unmap not frequently used keystrokes
" <Nop> means no operation...
map [[ <Nop>
map ]] <Nop>

" unmap gH
noremap gh gH<c-g> 

" quick print
noremap [o :g//#<left><left>

" turn on cursor column by keybindings...
function! <SID>find_cursor()
    let l:on = &cursorcolumn
    let l:choice = {
    \   0 : ["cursorcolumn", "cursorline"],
    \   1 : ["nocursorcolumn", "nocursorline"],
    \ }
    exe "normal! :set " . l:choice[l:on][0] . "\<CR>"
    exe "normal! :set " . l:choice[l:on][1] . "\<CR>"
endfunction
nnoremap [hC :call <SID>find_cursor()<CR>

" Search with hl enabled
nnoremap / :set hlsearch<CR>/
vnoremap / :set hlsearch<CR>/
command! -nargs=0 Nohlsearch :set nohlsearch
command! -nargs=0 Yeshlsearch :set hlsearch

" Readonly switch
command! -nargs=0 Readonly :set readonly
command! -nargs=0 NoReadonly :set noreadonly

" Leave space in ()
inoremap <c-b> <space><space><left>


" Use xsel for clipboard management in vim...
nnoremap <leader>vv :w !xsel -i -b<CR>:redraw<CR>
vnoremap <leader>vv :w !xsel -i -b<CR>:redraw<CR>

" <BS> for nohlsearch
nnoremap <BS> :nohlsearch<CR>

" Allow enabling/disenabling paste mode...
command! -nargs=0 PasteOn  :set paste
command! -nargs=0 PasteOff :set nopaste


" Shortcut to enable or disable relative line number...
function! <SID>toggle_relative_line_number()
    let l:on = &rnu
    let l:choice = {
    \   0 : "rnu"  ,
    \   1 : "nornu",
    \ }
    exe "normal! :set " . l:choice[l:on] . "\<CR>"
    exe "normal! :redraw "
    exe "normal! :set " . l:choice[l:on] . "\<CR>"
    exe "normal! :redraw "
endfunction
nnoremap [N :call <SID>toggle_relative_line_number()<CR>

" Join a visually selected text, copy it and undo...
vnoremap [Y Jgv"+yu

" vipgq without moving cursor...
function! <SID>vipgq_no_cursor_move()
    let l:pos_prev = getpos('.')
    exe "normal! vipgq"
    call setpos('.', l:pos_prev)
endfunction
nnoremap [gq :call <SID>vipgq_no_cursor_move()<CR>

" bd without disrupt the focus mode...
function! <SID>bd_no_disrupt_focus()
    " If focus mode is not supported???
    if !exists("g:focus_mode_on")
        " Delete the buffer and done...
        exe "bd"
        return 0
    endif

    let s:bufnr_orig = bufnr('%')
    let s:focus_mode_orig = g:focus_mode_on

    " Fetch the number of opened buffers
    let s:num_buf = len(getbufinfo({'buflisted' : 1}))

    " If focus mode is supported???
    if s:focus_mode_orig
        if s:num_buf > 1
            exe "bp"
            exe "bd " . s:bufnr_orig
        else
            redraw
            echom "No action is taken as this is the last buffer..."
        endif
    else
        exe "bd"
    endif
endfunction
nnoremap <silent> [bd :call <SID>bd_no_disrupt_focus()<CR>
