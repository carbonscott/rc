"=============CUSTOMIZE VIM=============
" mapleader
let mapleader = "["
source ~/.vim/runtimepath.vim

" settings
set wildmenu
set rnu
set nonumber
" For macvim #{
set guifont=Monaco:h13
" #}
" For Linux #{
set guifont=Monaco\ 13
"set guifont=Droid\ Sans\ Mono\ for\ Powerline\ 10
" #}
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
set wrap
set linebreak
set textwidth=0
"set StatusLine 
"set laststatus=2
set laststatus=0
set statusline+=%F
set formatoptions+=Mm
"ignore searching these files
set wildignore += "*.a, *.o, *.bmp, *.jpg, *.png, *.ico, *.swp, *.tmp, *.git, *.pdf"
set ruler
set formatoptions+=j "Make the comments notation invisible while joining or spliting lines
set backspace=indent,eol,start
"set virtualedit=all
