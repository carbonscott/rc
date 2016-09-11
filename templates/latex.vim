"============= strings to expand ============="
" set up the texts to complete...
" * latex equation...
let s:latex_eq = "\\begin{equation}\\label{...}\r...\r\\end{equation}" 

" * latex begin block...
let s:latex_begin = "\\begin{...}\r...\r\\end{...}"


"============= operations for cursor position after expansion ============="
" operations to move cursor to the right place...
" * latex equation...
let s:operation_eq = "<c-[>02<UP>f{;l"

" * latex begin block...
let s:operations_begin = "<c-[>2<UP>0f{l"

" ============ set up the command ===========
let s:tex_eq = "iab teq ".
								 \ s:latex_eq.
								 \ s:operation_eq
let s:tex_begin = "iab beg ".
								 \ s:latex_begin.
								 \ s:operations_begin

" giving Vim iab definition...
let s:snippets = [
\ s:tex_eq,
\ s:tex_begin,
\ ]

" run the evaluation of definition...
for snippet in s:snippets
	execute snippet
endfor
