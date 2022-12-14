" If already loaded, we're done...
if exists("loaded_Prompt")
    finish
endif
let loaded_Prompt = 1


let s:cpo_save = &cpo
set cpo&vim


" [[[ Implementation ]]]
function! prompt#run()
    while (1) 
        " search prompt with "search for file in path option enabled"...
        let s:cmd = "normal! :" . input("vim> ","","expression")

        echon "\n"
        execute s:cmd . "\<CR>"
    endwhile
endfunction

"=======================
" Search files...
"=======================
function! prompt#csearch()

    let s:cmd = ""

    while (s:cmd ==# "") 
        " search prompt with "search for file in path option enabled"...
        let s:file = input("file> ","","file_in_path")
        let s:cmd = "normal! :find " . s:file

        echon "\n"

        " don't execute it if \<c-[> or \<esc> is entered...
        if s:file !=# ""
            execute s:cmd . "\<CR>"
        endif

        redraw
    endwhile
endfunction




"=======================
" Search buffers...
"=======================
function! prompt#bsearch()
    " Bring up the buffer list...
    execute "buffers"

    let s:cmd = ""

    while (s:cmd ==# "") 
        " search prompt with "search for file in path option enabled"...
        let s:buffer = input("buffer> ","","buffer")
        let s:cmd = "normal! :find " . s:buffer

        echon "\n"

        " don't execute it if \<c-[> or \<esc> is entered...
        if s:buffer !=# ""
            execute s:cmd . "\<CR>"
        endif

        redraw
    endwhile
endfunction


"=======================
" Search marks...
"=======================
function! prompt#msearch()
    " Bring up the buffer list...
    execute "marks"

    let s:cmd = ""

    while (s:cmd ==# "") 
        " search prompt with "search for file in path option enabled"...
        let s:buffer = input("mark> ", "")
        let s:cmd = "normal! `" . s:buffer

        echon "\n"

        " don't execute it if \<c-[> or \<esc> is entered...
        if s:buffer !=# ""
            execute s:cmd
        endif

        redraw
    endwhile
endfunction


nnoremap [r :call prompt#run()<CR>
nnoremap [c :call prompt#csearch()<CR>
nnoremap [M :call prompt#msearch()<CR>
nnoremap [bb :call prompt#bsearch()<CR>


let &cpo = s:cpo_save
unlet s:cpo_save


finish


