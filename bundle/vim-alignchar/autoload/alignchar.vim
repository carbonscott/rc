function! AlignChar()
				" set the char to align to...
				let s:dialog = "which char to align: "
				let s:the_char = input(s:dialog, "#")

				" fig out line numbers of interested lines...
				let s:l_start = line("'<")
				let s:l_end = line("'>")
				let s:l_ids = sort([s:l_start, s:l_end])
				let s:interest_lines = range(s:l_ids[0],s:l_ids[1],1)
				
				"[debug]
				let g:interest_lines = s:interest_lines

				" read interesting lines...
				let s:yank_text = []
				for line in s:interest_lines
								call add(s:yank_text,getline(line))
				endfor
				let s:data_text = deepcopy(s:yank_text)

				" find where comments are...
				let s:comment_positions = []
				for each_one in s:data_text
								call add(s:comment_positions, match(each_one, s:the_char))
				endfor

				" align lines to the rightmost...
				let s:col_algin = max(s:comment_positions)
				for i in range(0,len(s:interest_lines)-1)
								call setpos('.',[0,s:interest_lines[i],s:comment_positions[i],0])
								execute "normal! i".repeat(" ",s:col_algin-s:comment_positions[i])
				endfor

				redraw
				return
endfunction

command! -nargs=0 AlignChar call AlignChar()

" don't add silent if there will be a prompt
vnoremap [a :<c-u>AlignChar<cr>

finish
