" If already loaded, we're done...
if exists("loaded_ClearHi")
    finish
endif
let loaded_ClearHi = 1


let s:cpo_save = &cpo
set cpo&vim


" [[[ Implementation ]]]

function ClearHi#run()
    let s:hi_groups = getmatches()
    let s:to_del_groups = []
    for i in range(0,len(s:hi_groups)-1)
        if s:hi_groups[i].group ==# 'CurrentStep'
            call add(s:to_del_groups,s:hi_groups[i].id)
        endif
    endfor
    "echo s:to_del_groups
    for i in s:to_del_groups
        call matchdelete(i)
    endfor
endfunction


nnoremap <silent> [ha :<c-u>call ClearHi#run()<CR>


let &cpo = s:cpo_save
unlet s:cpo_save


finish
