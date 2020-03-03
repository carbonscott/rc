template |head|
" If already loaded, we're done...
if exists("__loaded_SmartFold__")
    finish
endif
let __loaded_SmartFold__ = 1


let s:cpo_save = &cpo
set cpo&vim


" [[[ Implementation ]]]
____


let &cpo = s:cpo_save
unlet s:cpo_save


finish
endtemplate


template |function|
function! ____(____)
    ____
endfunction
endtemplate

template |if|
if ____ 
    ____
endif
endtemplate

template |highlight|
highlight ____ ctermfg=____ ctermbg=____
endtemplate

template |coloring|
function! WarningWithColor(info,color)
    execute 'echohl '.a:color
    echon   a:info
    execute 'echohl NONE'
endfunction
endtemplate

template |syntax-define-keyword|
syntax keyword ____ ____
endtemplate

template |syntax-define-match|
syntax match ____ ____ 
endtemplate

template |syntax-define-region|
syntax region ____ start=____ skip=____ end=____ 
endtemplate

template |section|
" ~~~~____~~~~
endtemplate

template |readfile|
readfile('____')
endtemplate

template |command|
command! -nargs=____ ____ call ____()
endtemplate

template |for|
for ____ in ____
    ____
endfor
endtemplate
