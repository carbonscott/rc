set background=dark
highlight Normal guifg=Yellow guibg=Black
highlight SpecialKey guifg=gray 
highlight NonText guifg=gray 
highlight CursorLineNR gui=bold guibg=Blue
au insertenter * hi CursorLineNR gui=bold guibg=DarkGreen
au InsertLeave * hi CursorLineNR gui=bold guibg=Blue

hi Search term=reverse guifg=White guifg=White guibg=NONE guibg=NONE
hi CursorLine gui=NONE guifg=White

set nocursorline

hi ColorColumn guibg=magenta
call matchadd('ColorColumn','\%80v',200)

syntax off

" color for completion...
set t_Co=256
hi Pmenu guibg=White guifg=Black
hi PmenuSel guibg=Blue guifg=White

hi Folded guibg=NONE

hi MyComment guifg=darkgray
nnoremap [d :syntax match MyComment "\v^\s*.*"<left><left><left>

finish
