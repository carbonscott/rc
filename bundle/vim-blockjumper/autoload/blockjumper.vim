function! blockjumper#up()
	let s:init_pos = getpos('.')
	let s:init_idn = indent('.')
	let l:cur_pos = s:init_pos[1:2]
	let l:cur_idn = s:init_idn
	while l:cur_idn >= s:init_idn && l:cur_pos[0] >= getpos('^')[1]
		let l:cur_pos[0] -= 1
		call cursor(l:cur_pos)
		let l:cur_idn = indent('.')
	endwhile
	let l:cur_pos[0] += 1
	call cursor(l:cur_pos)
	let l:cur_idn = indent('.')/&shiftwidth
	let l:cur_pos[1] = l:cur_idn + 1
	call cursor(l:cur_pos)
	" output information to ~blockjumper#down()~ 
	let s:up_limit = l:cur_pos
	let s:up_visual_pos = l:cur_pos
endfunction

function! blockjumper#down()
	let s:init_pos = getpos('.')
	let s:init_idn = indent('.')
	let l:cur_pos = s:init_pos[1:2]
	let l:cur_idn = s:init_idn
	while l:cur_idn >= s:init_idn && l:cur_pos[0] <= getpos('$')[1]
		let l:cur_pos[0] += 1
		call cursor(l:cur_pos)
		let l:cur_idn = indent('.')
	endwhile
	let l:cur_pos[0] -= 1
	call cursor(l:cur_pos)
	let l:cur_idn = indent('.')/&shiftwidth
	let l:cur_pos[1] = l:cur_idn + 1
	call cursor(l:cur_pos)
	let s:down_limit = l:cur_pos
endfunction

function! blockjumper#visual() 
	let l:cur_pos = getpos('.')[1:2]
	call blockjumper#down()
	call cursor(l:cur_pos)
	call blockjumper#up()
	if s:up_visual_pos[0] == 0
		let s:up_visual_pos[0] += 1
		call cursor(s:up_visual_pos)
	else
		call cursor(s:up_visual_pos)
	endif
	let l:height = s:down_limit[0] - s:up_limit[0]
	if l:height > 0
		execute "normal! v".l:height."j$h"
	elseif l:height == 0
		execute "normal! v0$h"
	else
		echo "Error!!!"
	endif
endfunction

	"	master
	
	"	master
			"	master
			"	master
			"	master
		" a
