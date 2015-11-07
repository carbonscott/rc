function! movingtext#setup()
	let s:current_line_num = line('.')
	let s:current_cusor_num = getpos('.')
" ## Selet block of text that can be manipulated
"let s:current_line_num = 10
	let s:block = [s:current_line_num, s:current_line_num + 2, 4,10]
	let s:block_manipulate = [s:block[0] - 1, s:block[1] + 1, s:block[2] - 1, s:block[3] + 1]
	let s:is_manipulate = [1, 1, 1, 1]
	" up 0
	if s:block_manipulate[0] < 0
		let s:block_manipulate[0] = 0
"		echo "This is the FIRST row and the block of text cannot be moved upwards."
		let s:is_manipulate[0] = 0
	endif
	" left 2
	if s:block_manipulate[2] < 0
		let s:block_manipulate[2] = 0
		"echo "This is the FIRST column and the block of text cannot be moved to the left."
		let s:is_manipulate[2] = 0
	endif
	" down 1
	if s:block_manipulate[1] > line('$')
		let s:block_manipulate[1] -= 1
		"echo "This is the Last row and the block of text cannot be moved downwards."
		let s:is_manipulate[1] = 0
	endif
	" right 3
	if s:block_manipulate[3] > col('$')
		let s:block_manipulate[3] -= 1
		"echo "This is the Last row and the block of text cannot be moved to the right."
		let s:is_manipulate[3] = 0
	endif


	" ## Save block of text that can be manipulated to variable
	let s:block_content = getline(s:block_manipulate[0], s:block_manipulate[1])
endfunction

function! movingtext#right()
	call movingtext#setup()
	if s:is_manipulate[3] != 0
		let s:temp_content = s:block_content[s:block[2]:s:block[3]]
		for i in s:temp_content
			execute ":normal! i".i."\<CR>"
			echo i
			call cursor(s:current_cusor_num[1] + 1, s:current_cusor_num[2])
		endfor
	else
		echo "This is the Last row and the block of text cannot be moved downwards."
	endif
endfunction

call movingtext#right()
"0123456789
"012aaa123aa"0123456789
"aaaaaaaaaaaaaaaaaaaa"0123456789
"aa"aaaaaaaaaaaaaaaaaaaa"0123456789
"aaaaaaaaaaaaaaaaaa"0123456789
"aaaaaaaaaaaaaaaaaaaa"0123456789
"aaaaaaaaaaaaaaaaaaaa"0123456789
"aaaaaaaaaaaaaaaaaaaa"0123456789
"aaaaaaaaaaaaaaaaaaaa"0123456789
"aaaaaaaaaaasdfaaaaaaaaaaa12312342134aaaaaaaaaaaaaaaaaaaaaaaaaaaaaa1231234213412312342134a
"01234.s:temp_con"0123456789
"tent[i]\<CR>56789
"0123456789
"0123456789
"0123456789
"0123456789
"01234asdf56789
"0123456789
