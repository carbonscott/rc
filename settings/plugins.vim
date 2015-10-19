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
" Bundle 'Valloric/YouCompleteMe'
" let g:ycm_global_ycm_extra_conf = "~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py"
" let g:ycm_collect_identifiers_from_tags_files = 1
" let g:ycm_seed_identifiers_with_syntax = 1
" let g:ycm_confirm_extra_conf = 0
" let g:tex_flavor='latex'
" " make YCM compatible with UltiSnips (using supertab)
" let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
" let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
" let g:SuperTabDefaultCompletionType = '<C-n>'
" "let g:ycm_path_to_python_interpreter = '/usr/bin/python'
" nnoremap <c-\> :YcmCompleter GoToDefinitionElseDeclaration<CR>
" "close preview windows after insertion
" let g:ycm_autoclose_preview_window_after_insertion = 1
"==================================================
"=============INSTALL OF davidhalter/jedi-vim =============
" Bundle 'davidhalter/jedi-vim'
" let g:jedi#auto_initialization = 0
" let g:jedi#auto_vim_configuration = 0
" let g:jedi#use_splits_not_buffers = "left"
" let g:jedi#show_call_signatures = "1"
" autocmd FileType python setlocal completeopt-=preview
"==================================================

"=============INSTALL OF Airline=============
"Bundle 'bling/vim-airline'
"let g:airline_powerline_fonts = 1
"let g:airline#extensions#whitespace#show_message = 0
"let g:airline#extensions#whitespace#checks = []
"let g:airline_theme='light'
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
"autocmd FileType python silent! SyntasticToggleMode<CR>
let g:syntastic_mode_map = { 'passive_filetypes': ['python'] }
"=============INSTALL OF vim-colorscheme=============
Plugin 'flazz/vim-colorschemes'
"==================================================

"=============INSTALL OF tabular=============
Plugin 'godlygeek/tabular'
"============================================

"=============INSTALL OF ctrlp=============
Plugin 'kien/ctrlp.vim'
let g:ctrlp_map = '[aa'
let g:ctrlp_show_hidden = 1
let g:ctrlp_working_path_mode = 0

nnoremap [ab :CtrlPBuffer<CR>
nnoremap [af :CtrlPMixed<CR>
nnoremap [al :CtrlPLine<CR>

"============================================
"=============INSTALL OF ctrlp=============
Bundle 'easymotion/vim-easymotion'
map [w [[w
map [j [[j
map [k [[k
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

