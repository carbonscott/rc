"key mapping: ->
noremap <F9> :set hlsearch<CR>
noremap <F10> :set nohlsearch<CR>
noremap [cl :clist<CR>
noremap [cn :cnext<CR>
noremap [cp :cprevious<CR>
"tab
noremap [t :tabnew<CR>
noremap [n :tabn<CR>
"inoremap <c-Tab> <c-o>:tabn<CR>
noremap [p :tabp<CR>
noremap <F7> :set list<CR>
noremap <F8> :set nolist<CR>
" buffer next, previous
noremap <F4> :ls<CR>:buffer 
noremap <F2> :bp<CR>
noremap <F3> :bn<CR>
noremap [du :diffupdate<CR>
nnoremap [vw bve
"======= map 0 and $ =====
nnoremap <s-h> 0
vnoremap <s-h> 0
nnoremap <s-l> $
vnoremap <s-l> $
"navigate escalted
nnoremap <c-h> 10h
nnoremap <c-l> 10l
nnoremap <c-j> 5j
nnoremap <c-k> 5k
vnoremap <c-h> 10h
vnoremap <c-l> 10l
vnoremap <c-j> 5j
vnoremap <c-k> 5k

"nnoremap <c-k>k zz
"nnoremap <c-k>l zt
"nnoremap <c-k>j zb
" nnoremap <c-l> zt
" nnoremap <c-j> zb

"====== open mindnote.md =======
nnoremap <silent> [q :rightbelow 13 split ~/.vim/mindnote.md<CR><c-w>k
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
"======= map 0 and $ =====
nnoremap <s-h> 0
vnoremap <s-h> 0
nnoremap <s-l> $
vnoremap <s-l> $
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
nnoremap [o :noh<CR>
nnoremap [mk :set hlsearch<CR>
nnoremap [mj :set nohlsearch<CR>
"save file
nnoremap <c-m> :w<CR>
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


"ab for [ ]
"ab [ [ ]
