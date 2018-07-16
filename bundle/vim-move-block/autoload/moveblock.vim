function! moveblock#h(choice) 
let l:choices = {
\		 'left'  : ['h','hP'],           
\		 'right' : ['l','p'], 
\		 'up'    : ['k',1],
\		 'down'  : ['j',1]
\}
let l:next = l:choices[a:choice][0]
let l:paste_mode= l:choices[a:choice][1]

let g:debug_mb = 'd'.l:paste_mode
\     .'gv'.l:next.'o'.l:next.'o'         
return 'd'.l:paste_mode
\     .'gv'.l:next.'o'.l:next.'o'         
endfunction

function! s:virtpos(expr)
    return add(getpos(a:expr),virtcol(a:expr))
endfunction

function! s:mk_sel(x)
    return 2*a:x[0] + a:x[1]
endfunction

function! moveblock#v(choice)
" Get info from visual block...  
" Initialize cursor position...
exe "normal! gv\<ESC>"                
let l:cur = s:virtpos('.')         
let l:vb = {
\   "'<" : s:virtpos("'<"),
\   "'>" : s:virtpos("'>")
\} 

" Directional convention
"    -- y [-1], determined by virtual column
"  |
"  x [1] 
let l:vb_shape = [
\   abs(l:vb["'<"][1]  - l:vb["'>"][1])  + 1,
\   abs(l:vb["'<"][-1] - l:vb["'>"][-1]) + 1
\ ]

" Set up decision matrix...
let l:H = l:vb_shape[0]
let l:W = l:vb_shape[1]
let l:bases = {
\   'up'    : 'oko' . l:H . 'k', 
\   'down'  :  'jo' . l:H . 'jo'
\ }

let l:adj = {
\   -3 : "o" ,
\   -2 : "oO" ,
\   -1 : "O",
\    0 : ""
\ }

" xyz of botright corner
let l:br   = [ 
\   max([l:vb["'<"][1], l:vb["'>"][1]]),
\   max([l:vb["'<"][-1],l:vb["'>"][-1]])
\ ]

" Cursor mode
let l:mode = [ 
\   (l:cur[1]-l:br[0] < 0 ) ? -1 : 0, 
\   (l:cur[-1]-l:br[1] < 0) ? -1 : 0
\ ]

" Decide action...
let l:act  = l:adj[s:mk_sel(l:mode)]
echo l:act

" Capture xyz of top-left and bot-right...
" gv remembers the visual selected region in this way:
" gv 1
" gv 2
" gv 3 = gv 1 result
" \" in execute command to escape \<c-v>...
exe "normal! gv" . l:act 
let l:xyz_br = s:virtpos(".")
exe "normal! gv" . l:act ."o" 
let l:xyz_tl = s:virtpos(".")

let l:jump = {
\   'up'   : l:xyz_br,
\   'down' : l:xyz_tl
\ }

" Cut the line text
exe "normal! gv" . l:bases[a:choice] . "d"
call setpos('.', l:jump[a:choice])
exe "normal! " (a:choice==#'up' ? "p" : (l:W-1)."lp")

" Reselect the
call setpos('.', l:xyz_tl)
exe "normal! \<c-v>" . (l:W-1) . "l" . (l:H-1) . "j" . "d"

" exe "normal! " . "kP"
exe "normal! " . (a:choice==#"up" ? "kP" : (l:H-1)."jP")

let g:cur  = l:cur
let g:item = s:mk_sel(l:mode)
let g:act  = l:act
let g:br   = l:br
let g:mode = l:mode
let g:xyz_tl = l:xyz_tl
let g:xyz_br = l:xyz_br
endfunction

vnoremap <UP> :<c-u> call moveblock#v('up')<CR>
    		\:normal! gvkoko<CR>
vnoremap <DOWN> :<c-u> call moveblock#v('down')<CR>
    		\:normal! gvjojo<CR>
vnoremap <expr> <LEFT> moveblock#h('left')
vnoremap <expr> <RIGHT> moveblock#h('right')
