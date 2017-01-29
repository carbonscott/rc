colorscheme default
set background=light
"highlight SpecialKey guifg=gray 
"highlight NonText guifg=gray 
"highlight Normal guifg=Yellow

set nocursorline

hi ColorColumn guibg=Magenta
call matchadd('ColorColumn','\%80v',200)

"hi Pmenu guibg=15 guifg=0
"hi PmenuSel guibg=33 guifg=15
syntax off
finish
