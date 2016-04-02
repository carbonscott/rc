function! moveblock#mb(choice)
	let s:choices = {
				\'left':['h','hP'],           
				\'right':['l','p'], 
				\'up':['k',1],
				\'down':['j',1]
	\}
	let s:pre_virtualedit = &virtualedit        "assign value based on test                
	set virtualedit=all                         "  * teneary                               
	"visual! d                                  "  * hash                                  
	let s:next = s:choices[a:choice][0]
	let s:paste_mode= s:choices[a:choice][1]
	return 'd'
			\.s:paste_mode
			\.'gv'.s:next.'o'.s:next.'o'         
			"\.':set virtualedit='.s:pre_virtualedit.'\<CR>'
			" use another map to turn off virtualedit           
			" use another map to be used as move and recorded   
			" in hash                                           
endfunction

"vnoremap <expr> <LEFT> moveblock#mb('left')
"vnoremap <expr> <RIGHT> moveblock#mb('right')

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
                                              
"vnoremap <UP> :call moveblock#swapline('up')<CR>
"   		\:normal! gvkoko<CR>
"vnoremap <DOWN> :call moveblock#swapline('down')<CR>
"   		\:normal! gvjojo<CR>

"vnoremap <expr> <UP> moveblock#mb('up')       
"vnoremap <expr> <DOWN> moveblock#swapline()    



