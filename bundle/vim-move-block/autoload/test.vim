function! SwaplineTest() range

		let s:l_info = [getpos("'<"),getpos("'>")]
		let s:len =   s:l_info[1][2] + s:l_info[1][3]
					\ 		- s:l_info[0][2] - s:l_info[0][3]
					\ 		+ 1


		" measure the error due to the offset by <TAB>...
		exe 'normal! gvokoko'
		let s:cursorposition = getcurpos()
		let s:error = s:cursorposition[4] - s:cursorposition[2]
		let s:len = s:len - s:error
		exe 'normal! gvjo'

		echo s:l_info[0]
		echo s:l_info[1]
		echo s:len         
                    
endfunction         
                         
vnoremap [u :call SwaplineTest()<CR>
                      
                      
" aaaaaaaaaaaaaaall Swa
" aaaaaaaaaaaaaaa     a                
" aaaaaaaaaaaaaaa     aaaaaaaaaaaaa    
" aaaaaaaaaaaaaaaaaaaaa aaaaaaa        
" aaaaaaaaaaaaaaaa aaaa         
" aaaaaaaaaaaaaaaaaaaaa  aa  a   
" aaaaaaaaaaaaaaaaaaaaaa         
" aaaaaaaaaaaaaaaaaaaaaa         
" aaaaaaaaaaaaaaa     aa      
" aaaaaaaaaaaaaaa     a    
"" aaaaaaaaaaaaaaa     a   
                           
														             
"                  bbbbb   
"                  bbbbb     
"                  bbbbb        
"                        
"                        
"                       
"                  _____
