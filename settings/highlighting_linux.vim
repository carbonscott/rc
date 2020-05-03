"""""""""""""""""""""""""""""""""""""""""""""""""
" This is totally dependent on the color palette.
"
" for i in {0..255}; do
"     printf "\x1b[38;5;${i}mcolour${i}\x1b[0m\n"
" done
"
" The above bash code should display all colors.
" Each color number correpsonds to one color.  
"""""""""""""""""""""""""""""""""""""""""""""""""

set t_Co=256

" Line...
hi CursorLineNR cterm=bold

" Search...
hi Search ctermfg=15 ctermbg=33
hi Visual ctermfg=15 ctermbg=33

" Column...
hi ColorColumn ctermbg=magenta
call matchadd('ColorColumn','\%81v',200)

" Completion...
hi Pmenu ctermfg=0 ctermbg=15 
hi PmenuSel ctermfg=15 ctermbg=33

" Fold...
" ...10 for solarized
" hi Folded cterm=None ctermfg=10 ctermbg=None
" ...8 for non-solarized
hi Folded cterm=None ctermfg=8 ctermbg=None

" Comment...
hi MyComment ctermfg=darkgray
nnoremap [d :syntax match MyComment "\v^\s*.*"<left><left><left>

" Cursor...
hi CursorColumn ctermfg=15 ctermbg=33
hi CursorLine cterm=None ctermfg=15 ctermbg=33
set nocursorline
