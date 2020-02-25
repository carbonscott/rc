function! s:virtpos(expr)
    return add(getpos(a:expr),virtcol(a:expr))
endfunction

function! s:mk_sel(x)
    return 2*a:x[0] + a:x[1]
endfunction

function! morespaces#run()
" Patch shorter lines...
let l:vb = {
\   "'<" : s:virtpos("'<"),
\   "'>" : s:virtpos("'>")
\} 
let g:vb = l:vb
let l:line_ids = range(l:vb["'<"][1],l:vb["'>"][1])
let g:line_ids = l:line_ids
let l:lines = []
let l:line_size = []
for line_id in l:line_ids
    let l:line = getline(line_id)
    call add(l:lines,l:line)
    call add(l:line_size,strlen(l:line))
endfor
let l:line_max_size = max(l:line_size)

let g:line_ids = l:line_ids
for id in range(len(l:line_ids))
    call setline(l:line_ids[id], l:lines[id].repeat(' ', ( l:line_max_size - strlen(l:lines[id]) )))
endfor
endfunction

vnoremap [<Space> :call morespaces#run()<CR>:normal! gv<CR>

finish
