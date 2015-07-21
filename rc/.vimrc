"=============CUSTOMIZE VIM=============
" mapleader
let mapleader = "["
source ~/.vim/runtimepath.vim

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
nnoremap <c-k>k zz
nnoremap <c-k>l zt
nnoremap <c-k>j zb
" nnoremap <c-l> zt
" nnoremap <c-j> zb

"====== open mindnote.md =======
nnoremap <silent> [q :rightbelow 13 split ~/.vim/mindnote.md<CR><c-w>k
"delete buffer
nnoremap <silent> [bd :bd<CR>
"resize window
nnoremap <silent> [l :vertical resize +2<CR>
nnoremap <silent> [h :vertical resize -2<CR>
nnoremap <silent> [k :resize -2<CR>
nnoremap <silent> [j :resize +2<CR>
"underline a single line
nnoremap <silent> [ul yypv0$r-
" map when insert
inoremap <c-h> <ESC>i
"inoremap <c-a> <c-o>a
inoremap <F6> <c-k>
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
nnoremap <c-k> zz
nnoremap <c-l> zt
nnoremap <c-j> zb

"====== treat <> as paired brackets =======
set matchpairs+=<:>
"====== open mindnote.md =======
nnoremap <silent> [q :rightbelow 13 split ~/.vim/mindnote.md<CR><c-w>k
"delete buffer
nnoremap <silent> [bd :bd<CR>
"resize window
nnoremap <silent> [l :vertical resize +2<CR>
nnoremap <silent> [h :vertical resize -2<CR>
nnoremap <silent> [k :resize -2<CR>
nnoremap <silent> [j :resize +2<CR>
"underline a single line
nnoremap <silent> [ul yypv0$r-
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
map <c-m> :w<CR>
map <c-h> :q<CR>
"map the folder key
nnoremap + zf
vnoremap + zf
nnoremap = zo
nnoremap - zc
nnoremap _ zd
vnoremap _ zd

"show file info
nnoremap <f5> :file<CR>

set wildmenu
set rnu
set guifont=Monaco\ 11
set tabstop=4
set softtabstop=4
set shiftwidth=4
set mouse=a
set nolist
set listchars=tab:▸\~,eol:¬
set guioptions-=T
set guioptions-=m
set guioptions-=r
set guioptions-=L
set autoindent
set number
set wrap
set linebreak
set textwidth=0
"set StatusLine 
"set laststatus=2
set laststatus=0
set statusline+=%F
set formatoptions+=Mm

"highlight
hi ColorColumn guibg=pink
highlight SpecialKey guifg=gray 
highlight NonText guifg=gray 
"set cursorline!
"highlight CursorLine ctermbg=234
highlight CursorLineNR cterm=bold ctermbg=12
au insertenter * hi CursorLineNR cterm=bold ctermbg=2
au InsertLeave * hi CursorLineNR cterm=bold ctermbg=12
autocmd filetype c,cpp,hpp,h :set cindent 
""select paragraphs and press "gq"
"======= markdwon textwidth & colorcolumn ========
autocmd BufRead,BufNewFile *.md set textwidth=84 
autocmd BufRead,BufNewFile *.md set colorcolumn=86 
autocmd BufRead,BufNewFile *.md set sw=2 
autocmd FileType markdown set colorcolumn=86 
autocmd BufNewFile,BufRead *.md set filetype=markdown
"=======================================

"==========================INSTALL OF VUNDLE==========================
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

"=============INSTALL OF Ultisnip=============
" Track the engine.
Plugin 'SirVer/ultisnips'
Bundle 'ervandew/supertab'
Bundle 'honza/vim-snippets'

" Snippets are separated from the engine. Add this if you want them:
"Plugin 'honza/vim-snippets'

" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"
"=============================================

"=============INSTALL OF YouCompleteMe=============
Bundle 'Valloric/YouCompleteMe'
let g:ycm_global_ycm_extra_conf = "~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py"
let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_seed_identifiers_with_syntax = 1
let g:ycm_confirm_extra_conf = 0
let g:tex_flavor='latex'
" make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'
"let g:ycm_path_to_python_interpreter = '/usr/bin/python'
nnoremap <c-\> :YcmCompleter GoToDefinitionElseDeclaration<CR>
"==================================================

"=============INSTALL OF Airline=============
Bundle 'bling/vim-airline'
let g:airline_powerline_fonts = 1
let g:airline#extensions#whitespace#show_message = 0
let g:airline#extensions#whitespace#checks = []
let g:airline_theme='light'
"==================================================

"=============INSTALL OF Syntastic=============
Bundle 'scrooloose/syntastic'
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
"=============INSTALL OF vim-colorscheme=============
Plugin 'flazz/vim-colorschemes'
"==================================================

"=============INSTALL OF tabular=============
Plugin 'godlygeek/tabular'
"============================================

	" ~~~~~~ALL OF YOUR PLUGINS MUST BE ADDED BEFORE THE FOLLOWING LINE~~~~~~~~~~~~
	"                                         ~~~~~~    
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
" 
"======================================================================================
"colorscheme
colorscheme matrix
" setting for matrix colorscheme
hi CursorLine guibg=#113311 guifg=white




