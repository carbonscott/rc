function smartfold#run()
  " record where search starts...
  let s:current_cusor = getpos('.')
  
		" get the search keyword...
  call setpos('.',[0,1,1,0])
  let s:search_term_orig = input("Search for: ")
  
  " empty string...
  if empty(s:search_term_orig) 
				call setpos('.',s:current_cusor)
				redraw
				echo "No string to search!"
				return 
		endif

		" initialize search...
  let s:search_term = '\<'.s:search_term_orig.'\>'
  let s:ln_init=1
  let s:ln_last=1
  let s:fold_position = []
  let s:ln_matched = search(s:search_term,'cW')

		" [debug]
		let g:ln_matched = s:ln_matched

  " prime test if it is necessary to search for a complete string...
  if s:ln_matched == 0
				let s:search_term = deepcopy(s:search_term_orig)
				let s:ln_matched = search(s:search_term,'cW')

				if s:ln_matched == 0
						let s:ln_last = line('$')
						call setpos('.',s:current_cusor)
						redraw
						echo "No string {".s:search_term."} is found"
				endif
  endif

		" record all matched positions...
		let s:fold_gaps = 0
  while s:ln_matched != 0
				if s:ln_matched - s:ln_last > s:fold_gaps 
						call add(s:fold_position,[s:ln_last,s:ln_matched-1])
				endif
				let s:ln_last = deepcopy(s:ln_matched+1) 
				" the search function here also moves the cursor 
				" that's how it ends the while conditional loop...
				let s:ln_matched = search(s:search_term,'W')
  endwhile

  "if match happened at the last line, do not add it...
  if s:ln_last < line('$')
				call add(s:fold_position,[s:ln_last,line('$')]) 
  endif

  " reset all folds and start to fold all non-matched lines...
  execute 'normal! zE'  
  if len(s:fold_position) > 0
				for item in s:fold_position
						execute item[0].','.item[1].'fold'
				endfor
  endif
		let @/=s:search_term

		" restore cursor position...
		call setpos('.',s:current_cusor)
endfunction

