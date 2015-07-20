" Ultisnip is a great plugin that help user customize snips in vim. 
" But I want to add some logic condition support in it.
" For example, in a mathematical formala, I want to determine the 
" length of division line for a fraction number by comparing lenght 
" of numerator verse denominator. Then vim could draw the line based
" on the longer length. 

" cursor is in normal mode
" normal -> insert -> run function -> waiting for action
" action: 
"     catching text just entered, 
"     copy text to some place,
"     substitute it into something else
function! DupLine()
python<<EOF
import vim 
cur_cursor = vim.current.window.cursor
working_line = cur_cursor[0]
print working_line
index = 0
while cur_cursor[0] == working_line and index < 10:
	cur_cursor = vim.current.window.cursor
	print "hello"
	index += 1
EOF
endfunction

