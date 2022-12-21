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


" If already loaded, we're done
if exists("loaded_HLS")
    finish
endif
let loaded_HLS = 1

" Preserve external compatibility options, then enable full vim compatibility
let s:cpo_save = &cpo
set cpo&vim


" Interface -- map
if maparg('n', 'n') == ""
    nnoremap <unique><silent> n   n:call HLS_NextOn()<CR>
endif
if maparg('N', 'n') == ""
    nnoremap <unique><silent> N   N:call HLS_NextOn()<CR>
endif


" Default highlighting for `Search` group...
highlight clear Search
highlight clear IncSearch
highlight clear NextSearch
highlight default Search    cterm=bold ctermfg=5 ctermbg=None
highlight default IncSearch cterm=bold ctermfg=red ctermbg=None
highlight default link NextSearch IncSearch


" Clear previous highlighting and set up new highlighting...
function! HLS_NextOn ()
    " Remove the previous highlighting, if any...
    call HLS_NextOff()

    " Add the new highlighting...
    let search_pattern = '\c\%#\%('.@/.'\)'
    "                     ^^~~~^^^  ~~
    " Ignore case .........: |  :    |
    " Under cursor __________|  :    |
    " Don't capture .............    |
    " Search register _______________|

    let w:HLS_Next_match_ID = matchadd('NextSearch', search_pattern)
endfunction

" Clear previou highlighting, if any...
function! HLS_NextOff ()
    if ( exists('w:HLS_Next_match_ID') && w:HLS_Next_match_ID > 0 )
        call matchdelete(w:HLS_Next_match_ID)
        unlet! w:HLS_Next_match_ID
    endif
endfunction


" Restore previous external compatibility options
let &cpo = s:cpo_save
unlet s:cpo_save

" Stop sourcing the vimscript until this command...
finish




" Text block to test the hlsearch
"
Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor
incididunt ut labore et dolore magna aliqua. Tempor id eu nisl nunc mi ipsum.
Ut placerat orci nulla pellentesque dignissim enim sit. Sed tempus urna et
pharetra pharetra massa. Nec feugiat in fermentum posuere urna. Gravida rutrum
quisque non tellus orci ac auctor augue mauris. Tincidunt praesent semper
feugiat nibh sed pulvinar proin gravida hendrerit. Dignissim cras tincidunt
lobortis feugiat. Odio euismod lacinia at quis risus sed vulputate odio. Id
cursus metus aliquam eleifend. Quis risus sed vulputate odio. Egestas tellus
rutrum tellus pellentesque eu. Volutpat consequat mauris nunc congue. Nunc
faucibus a pellentesque sit. Arcu non odio euismod lacinia at quis risus.
