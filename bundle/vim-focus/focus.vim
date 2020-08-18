" Copyright (c) 2020 Cong Wang
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

" [[[ COMPATIBLITY ]]]
" If already loaded, we're done...
if exists("loaded_Focus")
    finish
endif
let loaded_Focus = 1

let s:cpo_save = &cpo
set cpo&vim


" [[[ UTILITY ]]]
function! s:padding_window()
    " Create a padding to the left and move cursor back to previosu window...
    vertical topleft new   
    setlocal nornu
    vertical resize 40
    execute winnr('#') . 'wincmd w'

    " Create a padding to the right and move cursor back to previosu window...
    vertical botright new  
    setlocal nornu
    vertical resize 40
    execute winnr('#') . 'wincmd w'
endfunction

function! s:get_color(group, attr)
  return synIDattr(synIDtrans(hlID(a:group)), a:attr)
endfunction

function! s:set_color(group, attr, color)
  let gui = has('gui_running') || has('termguicolors') && &termguicolors
  execute printf('hi %s %s%s=%s', a:group, gui ? 'gui' : 'cterm', a:attr, a:color)
endfunction

" [[[ MAIN ]]]
function! s:main()
    " Split windows...
    call s:padding_window()

    " Set colors for the follow items...
    let s:color_items = [ 'VertSplit', 'StatusLine', 'StatusLineNC', 'SignColumn', 'NonText']
    "                                                 ^^^^^^^^^^^^
    " StatueLine non-current window........................:

    for grp in s:color_items
        call s:set_color(grp, 'fg', 'black')
        call s:set_color(grp, 'bg', 'NONE')
        call s:set_color(grp, ''  , 'NONE')    " Everything else
    endfor
endfunction


" [[[ SET COMMAND ]]]
command! -nargs=0 Focus call s:main()


" [[[ END ]]]
let &cpo = s:cpo_save
unlet s:cpo_save
finish
