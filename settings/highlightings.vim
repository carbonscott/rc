"
syntax on
"highlight
hi ColorColumn guibg=pink
highlight SpecialKey guifg=gray 
highlight NonText guifg=gray 
"set cursorline!
"highlight CursorLine ctermbg=234
highlight CursorLineNR cterm=bold ctermbg=12
au insertenter * hi CursorLineNR cterm=bold ctermbg=2
au InsertLeave * hi CursorLineNR cterm=bold ctermbg=12

"colorscheme
"colorscheme PaperColor
set background=dark
if has("gui_macvim")   " for Mac
	set background=light
	colorscheme solarized
endif
if has("gui_running")  " for Linux
	set background=light
	colorscheme solarized
endif
"colorscheme solarized
"colorscheme visualstudio
"colorscheme xemacs
" setting for matrix colorscheme
"colorscheme matrix
"hi CursorLine guibg=#113311 guifg=white
set nocursorline

" use color for s notes
source ~/.vim/settings/highlight_snote.md
