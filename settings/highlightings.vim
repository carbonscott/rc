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
"colorscheme visualstudio
colorscheme github
" setting for matrix colorscheme
" colorscheme matrix
" hi CursorLine guibg=#113311 guifg=white



