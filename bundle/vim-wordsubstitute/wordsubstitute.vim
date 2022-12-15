" If already loaded, we're done...
if exists("WordSubstitute")
    finish
endif
let WordSubstitute = 1


let s:cpo_save = &cpo
set cpo&vim


" [[[ Implementation ]]]
function! wordsubstitute#run1()
    let s:v_line_start = getpos("'<")[1]
    let s:v_line_end   = getpos("'>")[1]
    let s:is_run1      = 1
    echo "Please VISUAL select the token to substitute!"
endfunction




function! wordsubstitute#run2()
    if exists("s:is_run1")
        if s:is_run1 == 1
            let l:v_line_start = s:v_line_start
            let l:v_line_end   = s:v_line_end
        else
            let l:v_line_start = getpos('^')[1]
            let l:v_line_end   = getpos('$')[1]
        endif
        execute "normal! gv\"ay"

        let s:visual_block = @a
        let s:visual_block = substitute(s:visual_block,
                           \ '\([~./()\?\/\\]\)',
                           \	'\="\\".submatch(0)',
                           \ 'g'
                           \ )

        let s:input = input('Change to: ')
        exec l:v_line_start.",".l:v_line_end."s/".s:visual_block."/".s:input."/g"
        let s:is_run1 = 0
    else
        echo "Word Substitution is not activated!"
    endif
endfunction




function! wordsubstitute#run3()
    execute "normal! gv\"ay"

    execute 'set hlsearch'

    " let s:cursor_pos = getpos('.')
    " let s:winview    = winsaveview()

    let s:search_block = @a
    let s:search_block = escape(s:search_block,'.~/()\/[]')
    let @/ = s:search_block

    call search(@/, 'n')

    " let s:search_cmd = "normal! /".@/."/\<CR>"
    " call setpos('.', s:cursor_pos)
    " call winrestview(s:winview)
endfunction




function! wordsubstitute#run32()
    execute "normal! gv\"ay"

    execute 'set hlsearch'

    let s:search_block = @a
    let s:search_block = escape(s:search_block,'.~/()\/[]')
    let @/ = '\<'.s:search_block.'\>'

    call search(@/, 'n')
endfunction




function! wordsubstitute#run4()
    let s:original_pos = getpos('.')

    let s:input = input('Change to: ')
    let l:v_line_start = getpos('.')[1]
    let l:v_line_end   = input("Substitue within how many lines: ","")

    if empty(l:v_line_end)
       let l:v_line_end = getpos('$')[1] - l:v_line_start
    endif

    let l:v_line_end      += l:v_line_start
    let g:debug_v_line_end = l:v_line_end

    execute "normal! gv\"ay"

    let s:visual_block = @a
    let s:visual_block = substitute(s:visual_block,
                       \ '\([~./()\?\/\\]\)',
                       \ '\="\\".submatch(0)',
                       \ 'g'
                       \ )

    redraw

    exec l:v_line_start.",".l:v_line_end."s/".s:visual_block."/".s:input."/g"

    let s:original_pos[2] += len(s:input) - 1 
    call setpos('.',s:original_pos)
endfunction


vnoremap <silent> [gg :<c-u>call wordsubstitute#run1()<CR>
vnoremap <silent> [g/ :<c-u>set hlsearch<CR>:<c-u>call wordsubstitute#run3()<CR>
vnoremap <silent> [g? :<c-u>set hlsearch<CR>:<c-u>call wordsubstitute#run32()<CR>
snoremap <silent> [gc <c-g>:<c-u>call wordsubstitute#run4()<CR>
vnoremap <silent> [gc :<c-u>call wordsubstitute#run4()<CR>


let &cpo = s:cpo_save
unlet s:cpo_save


finish
