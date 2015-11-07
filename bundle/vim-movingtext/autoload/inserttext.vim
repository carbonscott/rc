function! inserttext#insert(text, position)
	let l:text = a:text
	let l:position = a:position
	call cursor(l:position)
	execute "normal i".l:text
endfunction

call inserttext#insert("|______|", [11, 2])


"aaaaaaaaaaaaa
