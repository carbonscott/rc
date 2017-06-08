"key mapping: ->
noremap <F9> :set hlsearch<CR>
noremap <F10> :set nohlsearch<CR>
noremap [cl :clist<CR>
noremap [cn :cnext<CR>
noremap [cp :cprevious<CR>
"tab
" noremap [t :tabnew<CR>
noremap [n :tabn<CR>
"inoremap <c-Tab> <c-o>:tabn<CR>
noremap [p :tabp<CR>
noremap <F7> :set list<CR>
noremap <F8> :set nolist<CR>
" buffer next, previous
noremap <F4> :ls<CR>:buffer 
nnoremap <F2> :hide bp<CR>
nnoremap <F3> :hide bn<CR>
noremap [du :diffupdate<CR>
nnoremap [vw bve
"======= map 0 and $ =====
nnoremap <s-h> g^
vnoremap <s-h> g^
nnoremap <s-l> g_
vnoremap <s-l> g_
"navigate escalted
nnoremap <c-h> 2h
nnoremap <c-l> 2l
nnoremap <c-j> 2j
nnoremap <c-k> 2k
vnoremap <c-h> 2h
vnoremap <c-l> 2l
vnoremap <c-j> 2j
vnoremap <c-k> 2k

"nnoremap <c-k>k zz
"nnoremap <c-k>l zt
"nnoremap <c-k>j zb
" nnoremap <c-l> zt
" nnoremap <c-j> zb

"====== open mindnote.md =======
"nnoremap <silent> [q :rightbelow 13 split ~/.vim/mindnote.md<CR><c-w>k
"delete buffer
nnoremap <silent> [bd :bd<CR>
"close files
nnoremap <silent> [bx :q<CR>
"resize window
"nnoremap <silent> [l :vertical resize +2<CR>
"nnoremap <silent> [h :vertical resize -2<CR>
"nnoremap <silent> [k :resize -2<CR>
"nnoremap <silent> [j :resize +2<CR>
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
nnoremap [bb :BuffersToggle<CR>
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

"show file info
nnoremap <f5> :!./%<CR>

"quickfix window switch
":. => current line in command line mode
":cc goto line
nnoremap [cw :cw<CR>:setlocal nornu<CR>
nnoremap [<CR> :.cc<CR>

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

" ab for [ ]
" ab [ [ ]
" ab perl Perl

nnoremap  [fc :source ~/.vim/settings/ThoughtRCColor.vim<CR>

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
" nnoremap [<Space> i<Space><Space><c-[>i
inoremap {<Space> {<Space><Space>}<Left><Left>
inoremap (<Space> (<Space><Space>)<Left><Left>
inoremap [<Space> [<Space><Space>]<Left><Left>
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

" finding placeholder ____ 
" nnoremap <silent> [j :call search('____')<CR>ve<c-g>
" snoremap <silent> [j :<c-u>call search('____')<CR>ve<c-g>
" vnoremap <silent> [j :<c-u>call search('____')<CR>ve<c-g>
" 
" nnoremap <silent> [k :call search('____','b')<CR>ve<c-g>
" snoremap <silent> [k :<c-u>call search('____','b')<CR>ve<c-g>
" vnoremap <silent> [k :<c-u>call search('____','b')<CR>ve<c-g>
" 
" inoremap <silent> [j <c-[>:call search('____')<CR>ve<c-g>
" inoremap <silent> [k <c-[>:call search('____','b')<CR>ve<c-g>

" adding whitespace by number
nnoremap <silent> [<space> i<space><esc>
" nnoremap <silent> [<space> :let s:n_space = input()<CR>:eval "normal ".s:n_space."a <CR>"
" nnoremap <silent> [<space> :exe "normal ".input("How many chars to input: ","10")."a "

" enable functional operator syntax...
nnoremap [ff :source ~/.vim/settings/syntax.vim<CR>

" enable the todo list custom highlighting...
let g:todo_done_switch = 0
nnoremap <silent> [t :source ~/.vim/syntax/custom_highlight.vim<CR>
