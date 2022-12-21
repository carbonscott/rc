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

syntax off            " ...no colorscheme by default

set t_Co=256

" Auto switch bg color...
" getenv() is not available in older version of vim
function! Getenv(env)
    let cmd = 'echo $' . a:env
    let ret = system(cmd)
    let res = substitute(ret, '\n', '', 'g')
    if  res == '' | let res = 'NONE' | endif
    return res
endfunction

let s:BG_COLOR = Getenv('BG_COLOR')
let w:null = 'NONE'
if s:BG_COLOR != w:null
    execute 'set bg=' . s:BG_COLOR
endif

" Line...
" hi CursorLineNr cterm=bold ctermfg=NONE ctermbg=NONE
" hi LineNr ctermfg=NONE ctermbg=NONE

" Search...
let s:Visual_ctermfg = { "light" : 255, "dark" : 15, w:null : 'NONE' }
execute  'hi Visual ctermfg= ' . s:Visual_ctermfg[s:BG_COLOR] . ' ctermbg=33'

" Column...
hi ColorColumn ctermbg=magenta
call matchadd('ColorColumn','\%81v',200)

" Completion...
hi Pmenu ctermfg=0 ctermbg=15 
let s:PmenuSel_ctermfg = { "light" : 255, "dark" : 15, w:null : 'NONE' }
execute  'hi PmenuSel ctermfg= ' . s:Visual_ctermfg[s:BG_COLOR] . ' ctermbg=33'

" ErrorMsg...
let s:ErrorMsg_ctermfg = { "light" : 255, "dark" : 15, w:null : 'NONE' }
execute 'hi ErrorMsg ctermfg= '. s:ErrorMsg_ctermfg[s:BG_COLOR]

" Fold...
hi Folded cterm=None ctermfg=7 ctermbg=None

" Comment...
hi MyComment ctermfg=darkgray
nnoremap [d :syntax match MyComment "\v^\s*.*"<left><left><left>

" Cursor...
let s:Cursor_ctermfg = { "light" : 255, "dark" : 15, w:null : 'NONE' }
execute  'hi CursorColumn ctermfg= ' . s:Cursor_ctermfg[s:BG_COLOR] . ' ctermbg=33'
execute  'hi CursorLine cterm=None ctermfg= ' . s:Cursor_ctermfg[s:BG_COLOR] . ' ctermbg=33'
set nocursorline
