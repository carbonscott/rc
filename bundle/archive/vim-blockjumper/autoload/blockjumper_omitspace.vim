function! blockjumper_omitspace#up()
	let s:init_pos = getpos('.')[1:2]
	let s:init_idn = indent('.')
	let s:init_content = getline('.')
	let l:cur_pos = s:init_pos
	let l:cur_idn = s:init_idn + 1

	while s:init_content == "" && s:init_pos[0] > 1
		let s:init_pos[0] -= 1
		call cursor(s:init_pos)
		let s:init_content = getline('.')
	endwhile
	if s:init_pos[0] == 1
		echo "This is the first line, and it is BLANK."
		let s:up_limit = l:cur_pos
		let s:up_visual_pos = l:cur_pos
		return
	endif

	if s:init_idn != 0
		echo "Select a line whose indent is 0."
		let s:up_limit = l:cur_pos
		let s:up_visual_pos = l:cur_pos
		return
	endif

	while l:cur_idn > s:init_idn && l:cur_pos[0] >= 1
		let l:cur_pos[0] -= 1
		call cursor(l:cur_pos)
		let l:cur_content = getline('.')
		if l:cur_content == ""
			let l:cur_idn = s:init_idn + 1
		else
			let l:cur_idn = indent('.')
		endif
	endwhile
	let l:cur_pos[1] = 1
	call cursor(l:cur_pos)
	
	" output information to ~blockjumper#down()~ 
	let s:up_limit = l:cur_pos
	let s:up_visual_pos = l:cur_pos
endfunction

function! blockjumper_omitspace#down()
	let s:init_pos = getpos('.')[1:2]
	let s:init_idn = indent('.')
	let s:init_content = getline('.')
	let l:cur_pos = s:init_pos
	let l:cur_idn = s:init_idn + 1

	while s:init_content == "" && s:init_pos[0] < getpos('$')[1]
		let s:init_pos[0] += 1
		call cursor(s:init_pos)
		let s:init_content = getline('.')
	endwhile
	if s:init_pos[0] == 1
		echo "This is the first line, and it is BLANK."
		let s:down_limit = l:cur_pos
		return
	endif

	if s:init_idn != 0
		echo "Select a line whose indent is 0."
		let s:down_limit = l:cur_pos
		return
	endif

	while l:cur_idn > s:init_idn && l:cur_pos[0] <= getpos('$')[1]
		let l:cur_pos[0] += 1
		call cursor(l:cur_pos)
		let l:cur_content = getline('.')
		if l:cur_content == ""
			let l:cur_idn = s:init_idn + 1
		else
			let l:cur_idn = indent('.')
		endif
	endwhile
	let l:cur_pos[1] = 1
	call cursor(l:cur_pos)

	let s:down_limit = l:cur_pos
endfunction

" function! blockjumper_omitspace#visual() 
" 	let l:cur_pos = getpos('.')[1:2]
" 	call blockjumper_omitspace#down()
" 	call cursor(l:cur_pos)
" 	call blockjumper_omitspace#up()
" 	if s:up_visual_pos[0] == 0
" 		let s:up_visual_pos[0] += 1
" 		call cursor(s:up_visual_pos)
" 	else
" 		call cursor(s:up_visual_pos)
" 	endif
" 	let l:height = s:down_limit[0] - s:up_limit[0]
" 	if l:height > 0
" 		execute "normal! v".l:height."j$h"
" 	elseif l:height == 0
" 		execute "normal! v0$h"
" 	else
" 		echo "Error!!!"
" 	endif
" endfunction

