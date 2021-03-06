"macvim meta key to be used
set macmeta
inoremap <M-[> <c-[>
vnoremap <M-[> <c-[>
onoremap <M-[> <c-[>
cnoremap <M-[> <c-[>
snoremap <M-[> <c-[>

nnoremap <M-]> <c-]>
nnoremap <M-i> <c-i>
nnoremap <M-t> <c-t>
vnoremap <M-]> <c-]>
vnoremap <M-i> <c-i>
vnoremap <M-t> <c-t>

inoremap <D-[> <c-[>
vnoremap <D-[> <c-[>
onoremap <D-[> <c-[>
cnoremap <D-[> <c-[>
snoremap <D-[> <c-[>

inoremap <M-u> <c-u>
inoremap <M-w> <c-w>

nnoremap <M-d> <c-d>
vnoremap <M-d> <c-d>
nnoremap <M-u> <c-u>
vnoremap <M-u> <c-u>

nnoremap <M-o> <c-o>
vnoremap <M-o> <c-o>
inoremap <M-o> <c-o>
inoremap <M-n> <c-n>
inoremap <M-p> <c-p>
inoremap <M-r> <c-r>
nnoremap <M-r> <c-r>
nnoremap <M-v> <c-v>

inoremap <M-d> <c-d>
inoremap <M-t> <c-t>

nnoremap <M-e> <c-e>
nnoremap <M-y> <c-y>

nnoremap <M-a> <c-a>
nnoremap <M-x> <c-x>

nnoremap <M-w> <c-w>
vnoremap <M-w> <c-w>

nnoremap <M-g> <c-g>
vnoremap <M-g> <c-g>
snoremap <M-g> <c-g>

cnoremap <M-d> <c-d>
cnoremap <M-h> <c-h>
cnoremap <M-j> <c-j>
cnoremap <M-k> <c-k>
cnoremap <M-l> <c-l>
cnoremap <M-u> <c-u>
cnoremap <M-r> <c-r>
cnoremap <M-w> <c-w>

onoremap <M-d> <c-d>
onoremap <M-h> <c-h>
onoremap <M-j> <c-j>
onoremap <M-k> <c-k>
onoremap <M-l> <c-l>

"inoremap <M-x> <c-x>
"set cpo+=<
"inoremap <special> <M-i> <C-X><C-F>
"inoremap <special> <M-b> <C-X><C-N>
inoremap <special> <M-]> <C-X><C-O>
inoremap <special> <M-i> <C-X><C-N>
   
"key mapping: ->
noremap <F9> :set hlsearch<CR>
noremap <F10> :set nohlsearch<CR>
noremap [cl :clist<CR>
noremap [cn :cnext<CR>
noremap [cp :cprevious<CR>
"tab
noremap [t :tabnew<CR>
noremap [n :tabn<CR>
"inoremap <M-Tab> <M-o>:tabn<CR>
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
nnoremap <M-h> 2h
nnoremap <M-l> 2l
nnoremap <M-j> 2j
nnoremap <M-k> 2k
vnoremap <M-h> 2h
vnoremap <M-l> 2l
vnoremap <M-j> 2j
vnoremap <M-k> 2k

"nnoremap <M-k>k zz
"nnoremap <M-k>l zt
"nnoremap <M-k>j zb
" nnoremap <M-l> zt
" nnoremap <M-j> zb

"====== open mindnote.md =======
nnoremap <silent> [q :rightbelow 13 split ~/.vim/mindnote.md<CR><M-w>k
"delete buffer
nnoremap <silent> [bd :bd<CR>
"close files
nnoremap <silent> [bx :q<CR>
"resize window
"nnoremap <silent> [l :vertical resize +2<CR>
"nnoremap <silent> [h :vertical resize -2<CR>
"nnoremap <silent> [k :resize -2<CR>
"nnoremap <silent> [j :resize +2<CR>
nnoremap <silent> <M-right> :vertical resize +2<CR>
nnoremap <silent> <M-left> :vertical resize -2<CR>
nnoremap <silent> <M-down> :resize -2<CR>
nnoremap <silent> <M-up> :resize +2<CR>

"underline a single line
nnoremap <silent> [ul yypv0$r-
" map when insert
inoremap <M-h> <ESC>i
"inoremap <M-a> <c-o>a
"inoremap <M-g> <c-k>
inoremap <F7> <c-o>:set list<CR>
inoremap <F8> <c-o>:set nolist<CR>
inoremap <M-j> <c-o>j
inoremap <M-k> <c-o>k
inoremap <M-l> <c-o>a
"inoremap <M-R> <c-o>e
inoremap <M-f> <c-o>e<c-o>a
inoremap <M-e> <c-o>b
"======= map 0 and $ =====
nnoremap <s-h> 0
vnoremap <s-h> 0
nnoremap <s-l> $
vnoremap <s-l> $
" nnoremap <M-k> zz
" nnoremap <M-l> zt
" nnoremap <M-j> zb

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
nnoremap <M-m> :w<CR>
" nnoremap <M-q> :q<CR>
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

"rebind the number from 6 to 0 to be reached from <M-1> to <M-5> {
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

"ab for [ ]
"ab [ [ ]
ab perl Perl
