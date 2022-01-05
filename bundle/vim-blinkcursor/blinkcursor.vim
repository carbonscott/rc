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
if exists("loaded_BC")
    finish
endif
let loaded_BC = 1

" Preserve external compatibility options, then enable full vim compatibility
let s:cpo_save = &cpo
set cpo&vim

" [[[ Interface ]]]

if maparg('[hc', 'n') == ""
    nnoremap <unique><silent>  [hc :call BC_Blink()<CR>
endif


" Define the color for cursor blinking...
" Color under cursor is reversed
highlight BC_Cursor cterm=bold ctermfg=red ctermbg=white

" Return the highlighting term...
function! BC_GetHL (group, term)
    " Store output of group to variable
    if v:version >= 800
        let output = execute('hi ' . a:group)
    else
        redir => output
        execute 'hi ' . a:group
        redir END
    endif

    " Find the term we're looking for
    return matchstr(output, a:term.'=\zs\S*')
endfunction

function! BC_SetHL (group, term)
    let HL_ctermfg = get(a:term, 'ctermfg', '')
    let HL_ctermbg = get(a:term, 'ctermbg', '')
    let HL_cmd = 'highlight ' . a:group . ' ctermfg=' . HL_ctermfg
                                      \ . ' ctermbg=' . HL_ctermbg

    let HL_clear = 'highlight clear '. a:group
    execute HL_clear
    execute HL_cmd
endfunction

function! BC_LinkHL (group, group_template)
    let HL_link = 'highlight link ' . a:group . ' ' . a:group_template

    let HL_clear = 'highlight clear '. a:group
    execute HL_clear
    execute HL_link
endfunction

function! BC_Sleep (blinktime)
    execute 'sleep ' . float2nr(a:blinktime * 1000) . 'm'
endfunction

function! BC_Blink()
    " Default highlight scheme...
    let BC_default_ctermfg = BC_GetHL('Cursor', 'ctermfg')
    let BC_default_ctermbg = BC_GetHL('Cursor', 'ctermbg')

    if BC_default_ctermfg =~ '' | let BC_default_ctermfg = 'NONE' | endif
    if BC_default_ctermbg =~ '' | let BC_default_ctermbg = 'NONE' | endif

    " New highlighting scheme...
    let BC_new_ctermfg = BC_GetHL('BC_Cursor', 'ctermfg')
    let BC_new_ctermbg = BC_GetHL('BC_Cursor', 'ctermbg')

    " Blink text 3 times...
    let blinktime = 0.05
    let blinks = 3
    for n in range(0, blinks)
        " Switch on BC color...
        let m_ID = matchadd('BC_Cursor', '\%#', 200)
        redraw

        " Sleep period...
        call BC_Sleep(blinktime)

        " Switch off BC color...
        call matchdelete(m_ID)
        redraw

        " Sleep period...
        call BC_Sleep(blinktime)
    endfor
endfunction


function! BC_BlinkScreen()
    " Default highlight scheme...
    let BC_default_ctermfg = BC_GetHL('Cursor', 'ctermfg')
    let BC_default_ctermbg = BC_GetHL('Cursor', 'ctermbg')

    if BC_default_ctermfg =~ '' | let BC_default_ctermfg = 'NONE' | endif
    if BC_default_ctermbg =~ '' | let BC_default_ctermbg = 'NONE' | endif

    " New highlighting scheme...
    let BC_new_ctermfg = BC_GetHL('BC_Cursor', 'ctermfg')
    let BC_new_ctermbg = BC_GetHL('BC_Cursor', 'ctermbg')

    " Blink text 3 times...
    let blinktime = 0.05
    let blinks = 3
    for n in range(0, blinks)
        " Switch on BC color...
        call BC_SetHL('Normal', {'ctermfg':BC_new_ctermfg,
                                \'ctermbg':BC_new_ctermbg})
        redraw

        " Sleep period...
        call BC_Sleep(blinktime)

        " Switch off BC color...
        call BC_SetHL('Normal', {'ctermfg':BC_default_ctermfg,
                                \'ctermbg':BC_default_ctermbg})
        redraw

        " Sleep period...
        call BC_Sleep(blinktime)
    endfor
endfunction

" Restore previous external compatibility options
let &cpo = s:cpo_save
unlet s:cpo_save

" Stop sourcing the vimscript until this command
finish
