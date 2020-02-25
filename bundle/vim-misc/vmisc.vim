function! vmisc#VirtualEdit ()
    " function:
    " enable virtualedit=all if it is not
    " otherwise, turn it off
    let s:flag = { 'all':'let &virtualedit=""',
                 \ 'none':'let &virtualedit="all"' }
    " echo s:flag["all"]
    if (&virtualedit ==# '' ) 
        "run corresponding command: turn it on
        "echom(s:flag['none'])  
        exe(s:flag['none'])          
        echom("Turn on virtualedit now")
    elseif (&virtualedit ==# 'all')   
        "run corresponding command: turn it off
        "echom(s:flag['all'])          
        exe(s:flag['all'])
        echom("Turn off virtualedit now") 
    else
        echmo("No setting is changed.")
    endif
endfunction

nnoremap [m :call vmisc#VirtualEdit()<CR>

finish
