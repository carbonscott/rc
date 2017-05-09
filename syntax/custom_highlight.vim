
" if exists("g:switch") 
" 				finish
" endif

highlight todo_done term=reverse ctermfg=Black ctermbg=NONE

if g:todo_done_switch == 1

				let g:todo_done_switch = 0
				syntax clear todo_done

else
				let g:todo_done_switch = 1
				syntax match todo_done "\v^.*\[x].*$"

endif 
