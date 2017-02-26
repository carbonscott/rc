function! prompt#run()

		while (1) 

				" search prompt with "search for file in path option enabled"...
				let s:cmd = "normal! :" . input("vim> ","","file_in_path")

				echon "\n"

				execute s:cmd . "\<CR>"

		endwhile

endfunction

"=======================
" command line search...
"=======================
function! prompt#csearch()

		let s:cmd = ""

		while (s:cmd ==# "") 

				" search prompt with "search for file in path option enabled"...
				let s:cmd = "normal! :find " . input("file> ","","file_in_path")

				echon "\n"

				execute s:cmd . "\<CR>"

				redraw

		endwhile

endfunction
