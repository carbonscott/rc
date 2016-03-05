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
	let s:len = s:l_info[1][2] - s:l_info[0][2] + 1
	echo s:len
	call setpos('.', s:l_info[0])              
	exe 'normal! d'.s:len.'l'                 
	 			\.s:choices[a:choice][0]                          
	 			\.'P'                           
	let s:new_pos = s:l_info[1]
	let s:new_pos[1] += (a:choice == 'down')?1:-1
	let s:new_pos[2] += 1
	call setpos('.', s:new_pos)  
	exe 'normal! d'.s:len.'l'                 
				\.s:choices[a:choice][1]                           
	call setpos('.',s:l_info[0])               
	exe 'normal! P'                            

	return 'gv'
			\.s:choices[a:choice][0]
			\.'o'.s:choices[a:choice][0].'o' 
endfunction                                   
                                               
"vnoremap <expr> <UP> moveblock#mb('up')       
vnoremap <UP> :call moveblock#swapline('up')<CR>
			\:normal! gvkoko<CR>
vnoremap <DOWN> :call moveblock#swapline('down')<CR>
			\:normal! gvjojo<CR>
"vnoremap <expr> <DOWN> moveblock#swapline()    


" sdfasfsasdf+++++-f9assafasdfsd
" sdf32412341-----dkfl8213      
" sdf32412341---adf-dkfl8214      
" sdf32412341-----dkfl8213      
" sdf32412341--sadfkfl8213      
" sdf32412341-----dkfl8213      
" sdf32412341-dfl8++++333f21      
" sdf32412341-dk+3fl821+++3      
" sdf32412341asd+3fl821+++      
" sdf32412341-dk03fl821234      
" sdf32412341-----dkfl8213      
" sdf32412341-----dkfl8213      
