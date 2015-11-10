function! moveanywhere#insert(text, position)
	let l:text = a:text
	let l:position = a:position
	" What is the data structure here for position
	call cursor(l:position)
	execute "normal i".l:text
endfunction

"call inserttext#insert("|______|", [11, 2])

function! moveanywhere#copyvisual()
	silent
	execute "normal! gvy"
	let l:textvisual = @"
	"echo l:textvisual
endfunction
"vnoremap <silent> <F6> :call copytext#copyvisual()<CR>

function! moveanywhere#edge()
	let l:visualpos = [getpos("'<")[1:2],getpos("'>")[1:2]]
	" left boundary
	" l:leftmostcol = number
	let l:leftmostcol = 0
	if l:visualpos[0][1] < l:visualpos[1][1]
		let l:leftmostcol = l:visualpos[0][1]
		echo l:leftmostcol
	else
		let l:leftmostcol = l:visualpos[1][1]
		echo "elseif"
		echo l:leftmostcol
	endif
	" right boundary
	let l:rightmostcol = 0
	if l:visualpos[0][1] < l:visualpos[1][1]
		let l:rightmostcol = l:visualpos[0][1]
		echo l:rightmostcol
	else
		let l:rightmostcol = l:visualpos[1][1]
		echo "elseif"
		echo l:rightmostcol
	endif
	" top boundary
	" bottom boundary
endfunction

vnoremap <silent> <F6> :call moveanywhere#edge()<CR>

"aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa


