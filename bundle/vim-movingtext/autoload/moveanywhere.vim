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
	execute "normal! gvd"
	let l:textvisual = @"
	return l:textvisual
	"echo l:textvisual
endfunction
"vnoremap <silent> <F6> :call copytext#copyvisual()<CR>

function! moveanywhere#left()
	" getpos("'<"): return [bufnum, lnum, col, off]
	let l:cursor_visualpos = [getpos("'<")[1:2],getpos("'>")[1:2]]
	" [t who is more left]{
	" [v l:cursor_leftmost_col]
	let l:cursor_leftmost_col = 0
	" [v l:cursor_visualpos] => {
	" l:cursor_visualpos[0][1] 
	" l:cursor_visualpos[1][1] 
	" }
	if l:cursor_visualpos[0][1] < l:cursor_visualpos[1][1]
		let l:cursor_leftmost_col = l:cursor_visualpos[0][1]
	else
		let l:cursor_leftmost_col = l:cursor_visualpos[1][1]
	endif
	"}
	" [v l:cursor_top_row] 
	let l:cursor_top_row = 0
	" getting the top row number in visual block
	" [t which is top?] {
	if l:cursor_visualpos[0][0] < l:cursor_visualpos[1][0]
		l:cursor_top_row = l:cursor_visualpos[0][0]
	else
		l:cursor_top_row = l:cursor_visualpos[1][0]
	endif
	" }
	
	" [f copy the right text] {
	let l:textvisual = moveanywhere#copyvisual()
	echo l:textvisual
	" }

	" [f move cursor to the right position]
	" move the cursor 2 more left from the top left position
	" cursor([lnum, col])
	" paste
	call moveanywhere#insert(l:textvisual, [l:cursor_top_row, l:cursor_leftmost_col - 2])
endfunction

vnoremap <silent> <F6> :call moveanywhere#left()<CR>

"aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
"aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
"aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
"aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
"aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
"aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
"aaaaaaa"aaaaaaa"aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
"abbacbbba
"abbacbbba
"aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
"aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa


