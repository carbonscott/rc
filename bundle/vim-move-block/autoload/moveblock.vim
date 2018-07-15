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


function! moveblock#v(choice)
" There are 3 important things: 
" * Each time, only 1xn texts are moved.
" * Always construct visual text from the selected visual block.
" * Paste(p) the 1xn texts at the end of block, paste(P) block in the beginning of 1xn texts.

" Get info from visual block...
exe 'normal! gv'
let l:cursor = s:virtpos('.')         " Initialize cursor position...
let l:vblock = [
\   s:virtpos("'<"),
\   s:virtpos("'>")
\] 

" Make regular visual selection by using vector...
let l:vblock_vec = [ 
\   l:vblock[1][-1] - l:vblock[0][-1],
\   l:vblock[1][1]  - l:vblock[0][1],
\   l:vblock[1][-1] - l:cursor[-1]
\ ]

let l:vblock_shape = [abs(l:vblock_vec[0])+1,abs(l:vblock_vec[1])+1]
let l:adj_x = (l:vblock_vec[0] < 0)  ? 
\   [                                                              
\    "O",                                                          
\    (l:vblock_shape[0]-1)."lP",                                   
\    (l:vblock_shape[0]-1)."l",                                    
\    "p",                                                          
\   ] :                                                            
\   [                                                              
\    "",                                                           
\    "lP",                                                         
\    "\<ESC>",                                                     
\    (l:vblock_shape[0]-1)."lp",                                   
\   ]                                                              
let l:adj_y = (l:vblock_vec[2] != 0) ? "o" : ""

let l:movement = {
\   'up'    : "gv" . l:adj_x[0] . l:adj_y . "oko" . l:vblock_shape[1] . "k", 
\   'down'  : "gv" . l:adj_x[0] . l:adj_y .  "jo" . l:vblock_shape[1] . "jo"
\ }

exe 'normal! ' . l:movement[a:choice] . 'd'

" Move text...
" Reselect visual block...
if a:choice ==# 'up'
    call setpos('.', l:vblock[1])
    exe 'normal! ' . l:adj_x[1]
    call setpos('.', l:vblock[0])
    exe 'normal! ' . l:adj_x[2] ."\<c-v>". (l:vblock_vec[0])."l" . (l:vblock_vec[1])."jd"
    call setpos('.', l:vblock[0])
    exe 'normal! ' . l:adj_x[2] ."kP"
else
    call setpos('.', l:vblock[0])
    exe 'normal! ' . l:adj_x[3]
    call setpos('.', l:vblock[0])
    exe 'normal! ' . l:adj_x[2] ."\<c-v>". (l:vblock_vec[0])."l" . (l:vblock_vec[1])."jd"
    call setpos('.', l:vblock[0])
    exe 'normal! ' . l:adj_x[2]. 'jP'
endif

let g:movement   = l:movement
let g:vblock     = l:vblock
let g:vblock_vec = l:vblock_vec
let g:cursor     = l:cursor
let g:adj_x      = l:adj_x
endfunction

vnoremap <UP> :<c-u> call moveblock#v('up')<CR>
   		\:normal! gvkoko<CR>
vnoremap <DOWN> :<c-u> call moveblock#v('down')<CR>
   		\:normal! gvjojo<CR>
vnoremap <expr> <LEFT> moveblock#h('left')
vnoremap <expr> <RIGHT> moveblock#h('right')
                   
