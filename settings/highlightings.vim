"
"syntax on
"hi Normal ctermfg=Yellow cterm=bold

"colorscheme
"colorscheme PaperColor
set background=dark
if has("gui_macvim")   " for Mac
	set background=dark
	"colorscheme solarized
	colorscheme darkZ
	hi Normal guifg=Yellow
endif
if has("gui_running")  " for Linux
	set background=dark
	colorscheme darkZ
	hi Normal guifg=Yellow
endif
hi Normal ctermfg=Yellow
"hi Normal guifg=Yellow

"highlight
hi ColorColumn guibg=pink 
highlight SpecialKey guifg=gray 
highlight NonText guifg=gray 
"set cursorline!
"highlight CursorLine ctermbg=234
highlight CursorLineNR cterm=bold ctermbg=12
au insertenter * hi CursorLineNR cterm=bold ctermbg=2
au InsertLeave * hi CursorLineNR cterm=bold ctermbg=12

"colorscheme solarized
"colorscheme visualstudio
"colorscheme xemacs
" setting for matrix colorscheme
"colorscheme matrix
"hi CursorLine guibg=#113311 guifg=white
set nocursorline

" use color for s notes
"source ~/.vim/settings/highlight_snote.md
"source /Users/Scott/.vim/settings/ThoughtRC_Color.vim
syntax off
