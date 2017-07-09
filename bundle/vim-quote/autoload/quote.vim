function! quote#fun2sub1()
	let s:block_start = [0,0,0,0]
	let s:block_end = [0,0,0,0]
	if s:cursor_1[1] > s:cursor_2[1]
		let s:block_end = s:cursor_1
		let s:block_start = s:cursor_2
	elseif s:cursor_1[1] < s:cursor_2[1]
		let s:block_end = s:cursor_2
		let s:block_start = s:cursor_1
	elseif s:cursor_1[1] == s:cursor_2[1]
		if s:cursor_1[2] >= s:cursor_2[2]
			let s:block_end = s:cursor_1
			let s:block_start = s:cursor_2
		else
			let s:block_end = s:cursor_2
			let s:block_start = s:cursor_1
		endif
	endif
endfunction

function! quote#insert_mark_pre()
	if !exists("s:mark_pre") || s:mark_pre == ""
		let s:mark_pre = "{"
	endif
	return s:mark_pre
endfunction

function! quote#insert_mark_pos()
	if !exists("s:mark_pos") || s:mark_pos == ""
		let s:mark_pos = "}"
	endif
	return s:mark_pos
endfunction

function! quote#tagadd()
	let l:insert_start = s:block_start 
	let l:insert_end = s:block_end
	"let l:insert_end[2] += 1
	call cursor(l:insert_end[1:2])
	execute "normal a\<C-R>=quote#insert_mark_pos()\<CR>"
	call cursor(l:insert_start[1:2])
	execute "normal i\<C-R>=quote#insert_mark_pre()\<CR>"
endfunction

function! quote#tagadd2()
	let l:insert_start = s:block_start
	let l:insert_end = s:block_end
	"let l:insert_end[2] += 1
	
	" Sequence does matter
	call cursor(l:insert_end[1:2])
	execute "normal a\<CR>\<C-R>=quote#insert_mark_pos()\<CR>"
	call cursor(l:insert_start[1:2])
	execute "normal i\<C-R>=quote#insert_mark_pre()\<CR>\<CR>"

	let l:text_height = l:insert_end[1] - l:insert_start[1]
	let l:insert_start[1] += 1
	call cursor(l:insert_start[1:2])
	execute "normal! \<C-V>".l:text_height."j>>"
endfunction

function! quote#user_input(...)
if empty(a:000)
				call inputsave()
				let s:mark_pre = input('prefix: ')
				let s:mark_pos = input('posfix: ')
				" let s:indent_on = input('indent?(y/n): ')
else
				let s:mark_pre = a:000[0]
				let s:mark_pos = a:000[1]
endif
endfunction


function! g:quote#fun2(...) 
	let s:cursor_1 = getpos("'<")
	let s:cursor_2 = getpos("'>")
	call quote#fun2sub1()
	call quote#user_input(a:000[0],a:000[1])
	while 1
		let s:indent_on = 'n'
		" TEST if s:indent_on carries any values?
		if !exists("s:indent_on") || s:indent_on == ""
			let s:indent_on = 'n'
		endif
		if s:indent_on == 'n'
			call quote#tagadd()
			break
		endif
		if s:indent_on == 'y'
			call quote#tagadd2()
			break
		endif
	endwhile
endfunction

