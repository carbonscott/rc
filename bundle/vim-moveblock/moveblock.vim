" Copyright (c) 2020-2023 Cong Wang
" 
" MIT License
" 
" Permission is hereby granted, free of charge, to any person obtaining
" a copy of this software and associated documentation files (the
" "Software"), to deal in the Software without restriction, including
" without limitation the rights to use, copy, modify, merge, publish,
" distribute, sublicense, and/or sell copies of the Software, and to
" permit persons to whom the Software is furnished to do so, subject to
" the following conditions:
" 
" The above copyright notice and this permission notice shall be
" included in all copies or substantial portions of the Software.
" 
" THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
" EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
" MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
" NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
" LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
" OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
" WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.


" If already loaded, we're done...
if exists("loaded_MoveBlock")
    finish
endif
let loaded_MoveBlock = 1


let s:cpo_save = &cpo
set cpo&vim


" [[[ Implementation ]]]

function! s:virtpos(expr)
    return add(getpos(a:expr),virtcol(a:expr))
endfunction

function! s:mk_sel(x)
    return 2*a:x[0] + a:x[1]
endfunction

function! moveblock#h(choice)
    " Save original virtualedit setting...
    let s:virtualedit = &virtualedit
    let &virtualedit  = "all"

    let l:choices = {
    \   'left'  : ['h','hP'],
    \   'right' : ['l','p'], 
    \}
    let l:next      = l:choices[a:choice][0]
    let l:paste_mode= l:choices[a:choice][1]
    exe "normal! gv" . "d". l:paste_mode

    " Restore original virtualedit setting...
    let &virtualedit = s:virtualedit
endfunction

function! moveblock#v(choice)
    " Save original virtualedit setting...
    let s:virtualedit = &virtualedit
    let &virtualedit  = "all"

    " Get info from visual block...
    " Initialize cursor position...
    exe "normal! gv"
    let l:cur = s:virtpos('.')
    let l:vb = {
    \   "'<" : s:virtpos("'<"),
    \   "'>" : s:virtpos("'>")
    \} 

    """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    " Directional convention
    "    -- y [-1], determined by virtual column
    "  |
    "  x [1] 
    """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    let l:vb_shape = [
    \   abs(l:vb["'<"][1]  - l:vb["'>"][1])  + 1,
    \   abs(l:vb["'<"][-1] - l:vb["'>"][-1]) + 1
    \ ]

    " Set up decision matrix...
    let l:H = l:vb_shape[0]
    let l:W = l:vb_shape[1]

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

    let l:motion = {
    \   'up'   : 1,
    \   'down' : 0
    \ }

    " Cut the line text
    " "y" to capture the non standard blank (there are no spaces in reality, just a visual blank)
    let l:bases = {
    \   'up'    : 'oko' . l:H . 'k', 
    \   'down'  :  'jo' . l:H . 'jo'
    \ }
    exe "normal! gv" . l:bases[a:choice] . "y"
    exe "normal! gv" . "d"
    call setpos('.', l:jump[a:choice])
    exe "normal! " (l:motion[a:choice] ? "p" : (l:W-1 ? (l:W-1)."l" : "")."p")

    " Reselect the
    call setpos('.', l:xyz_tl)
    exe "normal! \<c-v>" . 
    \   (l:W-1 ? (l:W-1)."l"  : "") . 
    \   (l:H-1 ? (l:H-1). "j" : "") . "d"

    exe "normal! " . (l:motion[a:choice] ? "kP" : "jP")

    " let g:cur    = l:cur
    " let g:item   = s:mk_sel(l:mode)
    " let g:act    = l:act
    " let g:br     = l:br
    " let g:mode   = l:mode
    " let g:xyz_tl = l:xyz_tl
    " let g:xyz_br = l:xyz_br
    " let g:W      = l:W
    " let g:H      = l:H
    " let g:bases  = l:bases

    " Restore original virtualedit setting...
    let &virtualedit = s:virtualedit
endfunction

vnoremap  <UP>    :<c-u> call moveblock#v('up')<CR>
       \:normal! gvkoko<CR>
vnoremap  <DOWN>  :<c-u> call moveblock#v('down')<CR>
       \:normal! gvjojo<CR>
vnoremap  <LEFT>  :<c-u> call moveblock#h('left')<CR>
       \:normal! gvhoho<CR>
vnoremap  <RIGHT> :<c-u> call moveblock#h('right')<CR>
       \:normal! gvlolo<CR>

let &cpo = s:cpo_save
unlet s:cpo_save


finish
