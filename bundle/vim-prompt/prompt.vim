function! prompt#run()
		while (1) 
				" search prompt with "search for file in path option enabled"...
				let s:cmd = "normal! :" . input("vim> ","","expression")

				echon "\n"
				execute s:cmd . "\<CR>"
		endwhile
endfunction

"=======================
" Search files...
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




"=======================
" Search buffers...
"=======================
function! prompt#bsearch()
		let s:cmd = ""

		while (s:cmd ==# "") 
				" search prompt with "search for file in path option enabled"...
				let s:buffer = input("buffer> ","","buffer")
				let s:cmd = "normal! :find " . s:buffer

				echon "\n"

				" don't execute it if \<c-[> or \<esc> is entered...
				if s:buffer !=# ""
						execute s:cmd . "\<CR>"
				endif

				redraw
		endwhile
endfunction


nnoremap [r :call prompt#run()<CR>
nnoremap [c :call prompt#csearch()<CR>
nnoremap [<s-b> :call prompt#bsearch()<CR>

finish
