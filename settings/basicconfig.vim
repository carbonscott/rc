"=============CUSTOMIZE VIM=============
" mapleader
let mapleader = "["
source ~/.vim/runtimepath.vim

" settings
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
"ignore searching these files
set wildignore += "*.a, *.o, *.bmp, *.jpg, *.png, *.ico, *.swp, *.tmp, *.git, *.pdf"
