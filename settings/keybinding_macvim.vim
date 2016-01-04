"macvim meta key to be used
"disable all window shortcut from OS X
if has("gui_macvim")
    macmenu &File.New\ Window key=<nop>
    macmenu &File.New\ Tab key=<nop>
    macmenu &File.Open key=<nop>
    macmenu &File.Open\ Tab key=<nop>
    macmenu &File.Close\ Window key=<nop>
    macmenu &File.Close key=<nop>
    macmenu &File.Save key=<nop>
    macmenu &File.Save\ As key=<nop>
    macmenu &File.Print key=<nop>
endif
set macmeta
inoremap <D-[> <c-[>
vnoremap <D-[> <c-[>
onoremap <D-[> <c-[>
cnoremap <D-[> <c-[>
snoremap <D-[> <c-[>

inoremap <D-u> <c-u>
inoremap <D-w> <c-w>

nnoremap <D-d> <c-d>
vnoremap <D-d> <c-d>
nnoremap <D-u> <c-u>
vnoremap <D-u> <c-u>

inoremap <D-o> <c-o>
inoremap <D-n> <c-n>
inoremap <D-p> <c-p>
inoremap <D-r> <c-r>
nnoremap <D-r> <c-r>
nnoremap <D-v> <c-v>

inoremap <D-d> <c-d>
inoremap <D-t> <c-t>

nnoremap <D-e> <c-e>
nnoremap <D-y> <c-y>

nnoremap <D-a> <c-a>
nnoremap <D-x> <c-x>

nnoremap <D-w> <c-w>
vnoremap <D-w> <c-w>

vnoremap <D-g> <c-g>
snoremap <D-g> <c-g>

cnoremap <D-d> <c-d>
cnoremap <D-h> <c-h>
cnoremap <D-j> <c-j>
cnoremap <D-k> <c-k>
cnoremap <D-l> <c-l>

onoremap <D-d> <c-d>
onoremap <D-h> <c-h>
onoremap <D-j> <c-j>
onoremap <D-k> <c-k>
onoremap <D-l> <c-l>

"inoremap <D-x> <c-x>
"set cpo+=<
inoremap <special> <D-i> <C-X><C-F>
inoremap <special> <D-b> <C-X><C-N>

"key mapping: ->
noremap <F9> :set hlsearch<CR>
noremap <F10> :set nohlsearch<CR>
noremap [cl :clist<CR>
noremap [cn :cnext<CR>
noremap [cp :cprevious<CR>
"tab
noremap [t :tabnew<CR>
noremap [n :tabn<CR>
"inoremap <D-Tab> <D-o>:tabn<CR>
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
nnoremap <D-h> 2h
nnoremap <D-l> 2l
nnoremap <D-j> 2j
nnoremap <D-k> 2k
vnoremap <D-h> 2h
vnoremap <D-l> 2l
vnoremap <D-j> 2j
vnoremap <D-k> 2k

"nnoremap <D-k>k zz
"nnoremap <D-k>l zt
"nnoremap <D-k>j zb
" nnoremap <D-l> zt
" nnoremap <D-j> zb

"====== open mindnote.md =======
nnoremap <silent> [q :rightbelow 13 split ~/.vim/mindnote.md<CR><D-w>k
"delete buffer
nnoremap <silent> [bd :bd<CR>
"close files
nnoremap <silent> [bx :q<CR>
"resize window
"nnoremap <silent> [l :vertical resize +2<CR>
"nnoremap <silent> [h :vertical resize -2<CR>
"nnoremap <silent> [k :resize -2<CR>
"nnoremap <silent> [j :resize +2<CR>
nnoremap <silent> <D-right> :vertical resize +2<CR>
nnoremap <silent> <D-left> :vertical resize -2<CR>
nnoremap <silent> <D-down> :resize -2<CR>
nnoremap <silent> <D-up> :resize +2<CR>

"underline a single line
nnoremap <silent> [ul yypv0$r-
" map when insert
inoremap <D-h> <ESC>i
"inoremap <D-a> <c-o>a
"inoremap <D-g> <c-k>
inoremap <F7> <c-o>:set list<CR>
inoremap <F8> <c-o>:set nolist<CR>
inoremap <D-j> <c-o>j
inoremap <D-k> <c-o>k
inoremap <D-l> <c-o>a
"inoremap <D-R> <c-o>e
inoremap <D-f> <c-o>e<c-o>a
inoremap <D-e> <c-o>b
"======= map 0 and $ =====
nnoremap <s-h> 0
vnoremap <s-h> 0
nnoremap <s-l> $
vnoremap <s-l> $
" nnoremap <D-k> zz
" nnoremap <D-l> zt
" nnoremap <D-j> zb

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
nnoremap <D-m> :w<CR>
" nnoremap <D-q> :q<CR>
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

"rebind the number from 6 to 0 to be reached from <D-1> to <D-5> {
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
