set background=dark
if has("gui_macvim")   " for Mac
	set background=dark
	"colorscheme solarized
	hi Normal guifg=Yellow
endif
if has("gui_running")  " for Linux
	set background=dark
	hi Normal guifg=Yellow
endif
hi Normal ctermfg=Yellow

highlight SpecialKey guifg=gray 
highlight NonText guifg=gray 
"set cursorline!
"highlight CursorLine ctermbg=234
highlight CursorLineNR cterm=bold ctermbg=12
au insertenter * hi CursorLineNR cterm=bold ctermbg=2
au InsertLeave * hi CursorLineNR cterm=bold ctermbg=12

"#c:Search
"#turn_off:hi Search term=reverse ctermfg=0 ctermbg=11 guifg=Black guibg=Yellow
hi Search term=reverse ctermfg=White guifg=White ctermbg=NONE guibg=NONE

set nocursorline

hi ColorColumn ctermbg=magenta
call matchadd('ColorColumn','\%70v',200)

syntax off


