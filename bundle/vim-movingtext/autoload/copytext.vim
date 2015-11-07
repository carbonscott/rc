function! copytext#copyvisual()
	silent
	execute "normal! gvy"
	let l:textvisual = @"
	echo l:textvisual
endfunction


vnoremap <silent> <F6> :call copytext#copyvisual()<CR>
"aasdfssssssssssssssss
"
"aasdfssssssssssssssss
