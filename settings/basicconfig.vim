"=============CUSTOMIZE VIM=============
" mapleader
let mapleader = "["

" settings
set wildmenu
set rnu
set nonumber
set tabstop=1
set softtabstop=1
set expandtab
set shiftwidth=2
set mouse=a
set nolist
set listchars=tab:>-
set guioptions-=T
set guioptions-=m
set guioptions-=r
set guioptions-=L
set autoindent
set wrap
set linebreak
set textwidth=0
set laststatus=0
set statusline+=%F
set formatoptions+=Mm
"ignore searching these files
set wildignore += "*.a, *.o, *.bmp, *.jpg, *.png, *.ico, *.swp, *.tmp, *.git, *.pdf"
set ruler
set formatoptions+=j "Make the comments notation invisible while joining or spliting lines
set backspace=indent,eol,start

" let find command do recursive search...
set path=**

" search highlight
set incsearch
set hlsearch
