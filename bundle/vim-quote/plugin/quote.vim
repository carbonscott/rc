" This program serves purpose to add quote for section selected in visual
" mode.

" 0. press [q to call function and trigger visual mode 
vnoremap [o :<c-u>call quote#fun2()<CR>


" Algorithm
" 0. press [q to call function
" 1. move cursor to a point
" 2. press [o to call function2
" 
" function:
" 	initial cursor pos;
" 
" function2:
" 	inital cursor pos;
" 	call function2.1;
" 	call funciton2.2;
" 
" 	function2.1:
" 		compare row number between two pos;
" 			who has larger row number, marked as block-end;
" 			smaller one, as block-start;
" 			otherwise, compare col num;
" 				bigger one, block-end;
" 				smaller one, block-start;
" 				otherwise, do nothing;
" 
" 	function2.2:
" 		add pre quote before block-start;
" 		add post quote after block-end;
"












