set background=dark
highlight Normal guifg=Yellow
highlight SpecialKey guifg=gray 
highlight NonText guifg=gray 
highlight CursorLineNR cterm=bold ctermbg=12
au insertenter * hi CursorLineNR cterm=bold ctermbg=2
au InsertLeave * hi CursorLineNR cterm=bold ctermbg=12

"// hi Search term=reverse ctermfg=White guifg=White ctermbg=NONE guibg=NONE
hi Search ctermfg=15 ctermbg=197
hi CursorLine cterm=NONE ctermfg=White

set nocursorline

hi ColorColumn ctermbg=magenta
call matchadd('ColorColumn','\%80v',200)

syntax off

" color for completion...
set t_Co=256
hi Pmenu ctermbg=15 ctermfg=0
hi PmenuSel ctermbg=33 ctermfg=15

hi Folded ctermbg=None

hi MyComment ctermfg=darkgray
nnoremap [d :syntax match MyComment "\v^\s*.*"<left><left><left>

finish
