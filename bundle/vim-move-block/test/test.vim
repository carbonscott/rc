function! moveblock#swapline(choice)                 
	" if 
	let &virtualedit = 'all'
	" get info from visual block               
	let s:l_info = [getpos("'<"),getpos("'>")] 
                     " left         "right     
	
	" hash data for logic
	let s:choices = {
			\'down':['j','k'],
			\'up':['k','j']
		\}

	"delete line section                       
	let s:len = s:l_info[1][2] - s:l_info[0][2] + 1 " [2]:column, [1]:right visual,[0]:left visual 
	echo s:len
	call setpos('.', s:l_info[0]) " curosr on the left visual             
	exe 'normal! d'.s:len.'l'                 
	 			\.s:choices[a:choice][0]                          
	 			\.'P'                           
	let s:new_pos = s:l_info[1]  " right visual 
	let s:new_pos[1] += (a:choice == 'down')?1:-1  " down, line num + 1; otherwise -1
	let s:new_pos[2] += 1                          " col + 1
	call setpos('.', s:new_pos)   " ?_ is it: the right hand side of ----- text block pasted
	exe 'normal! d'.s:len.'l'                 
				\.s:choices[a:choice][1]                           
	call setpos('.',s:l_info[0])  " initial left visual
	exe 'normal! P'                            

	return 'gv'
			\.s:choices[a:choice][0]
			\.'o'.s:choices[a:choice][0].'o' 
endfunction                                   


function! moveblock#swaplines(choice)                 
	" 5 up = 1 down x 5
	" get info from visual block               
	let s:l_info = [getpos("'<"),getpos("'>")] 
                     " left         "right     
	
	" height
	let s:height = s:l_info[1][1] - s:l_info[0][1] + 1 " substract between line numbers and offset by 1

	for swap_num in range(1,s:height)
		:call moveblock#swapline(a:choice)
	endfor
endfunction
                                               
"vnoremap <expr> <UP> moveblock#mb('up')       
" vnoremap <UP> :call moveblock#swapline('up')<CR>
" 			\:normal! gvkoko<CR>
" vnoremap <DOWN> :call moveblock#swapline('down')<CR>
" 			\:normal! gvjojo<CR>
"vnoremap <expr> <DOWN> moveblock#swapline()    
vnoremap <UP> :call moveblock#swaplines('up')<CR>
			\:normal! gvkoko<CR>
vnoremap <DOWN> :call moveblock#swaplines('down')<CR>
			\:normal! gvjojo<CR>

                                
" sdfasfsasdf+++++-f9assafasdfsd   
" sdf32412341dkfl8213   8214asdf   
" sdf3241f32412341---adf-dkfldf         
" sd-----2341-----dkfl8213      
" sdf32412341--sadfkfl8213      
" sdf32412341-----dkfl8213      
" sdf32412341-dfl8++++333f21      
" sdf32412341-dk+3fl821+++3      
" sdf32412341asd+3fl821+++      
" sdf32412341-dk03fl821234      
" sdf32412341-----dkfl8213      
" sdf32412341-----dkfl8213      
