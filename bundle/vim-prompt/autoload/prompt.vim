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
				let s:file = input("file> ","","file_in_path")
				let s:cmd = "normal! :find " . s:file

				echon "\n"

				" don't execute it if \<c-[> or \<esc> is entered...
				if s:file !=# ""
						execute s:cmd . "\<CR>"
				endif

				redraw

		endwhile

endfunction
