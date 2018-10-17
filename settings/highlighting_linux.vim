"    set background=dark
set t_Co=256
highlight CursorLineNR cterm=bold
"    highlight Normal guifg=Yellow
"    highlight SpecialKey guifg=gray 
"    highlight NonText guifg=gray 
"    highlight CursorLineNR cterm=bold ctermbg=12
"    au insertenter * hi CursorLineNR cterm=bold ctermbg=2
"    au InsertLeave * hi CursorLineNR cterm=bold ctermbg=12

hi Search ctermfg=15 ctermbg=197
"    hi CursorLine cterm=NONE ctermfg=White

hi Visual ctermfg=15 ctermbg=33

set nocursorline

hi ColorColumn ctermbg=magenta
call matchadd('ColorColumn','\%80v',200)

syntax off

" color for completion...
hi Pmenu ctermbg=15 ctermfg=0
hi PmenuSel ctermbg=33 ctermfg=15

hi Folded ctermbg=None

hi MyComment ctermfg=darkgray
nnoremap [d :syntax match MyComment "\v^\s*.*"<left><left><left>

" color cursor column
hi CursorColumn ctermbg=33

finish
