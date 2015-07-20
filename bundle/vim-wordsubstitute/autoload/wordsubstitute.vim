function! wordsubstitute#run1()
	let s:v_line_start = getpos("'<")[1]
	let s:v_line_end = getpos("'>")[1]
	let s:is_run1 = 1
	echo "Please VISUAL select the token to substitute!"
endfunction

function! wordsubstitute#run2()
	if exists("s:is_run1")
		if s:is_run1 == 1
			let l:v_line_start = s:v_line_start
			let l:v_line_end = s:v_line_end
		else
			let l:v_line_start = getpos('^')[1]
			let l:v_line_end = getpos('$')[1]
		endif
		execute "normal! gv\"ay"

		let s:visual_block = @a
		let s:input = input('Change to: ')
		exec l:v_line_start.",".l:v_line_end."s/"."\\<".s:visual_block."\\>"."/".s:input."/g"
		"echo "normal! :"s:v_line_start.",".s:v_line_end."s/".s:visual_block."/".s:input."/g"
		let s:is_run1 = 0
	else
		echo "Word Substitution is not activated!"
	endif
endfunction

function! wordsubstitute#run3()
	execute "normal! gv\"ay"
	let @/ = @a
	"set nohlsearch
	let s:search_cmd = "normal! /".@/."/\<CR>"
	execute s:search_cmd."N"
	"set hlsearch
endfunction

