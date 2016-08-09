function smartfold#run()
	"#a: moving cursor back purpose
	let s:current_cusor = getpos('.')

  call setpos('.',[0,1,1,0])
  let s:search_term_orig = input("Search for: ")

	"#a: ?:empty string
	if empty(s:search_term_orig) 
		call setpos('.',s:current_cusor)
		redraw
		echo "No string to search!"
		return 
	endif

  let s:search_term = '\<'.s:search_term_orig.'\>'
  let s:ln_init=1
  let s:ln_last=1
  let s:fold_position = []

  let s:ln_matched = search(s:search_term,'W')
  "#s: prime test if it necessary to search for whole matched string 
  if s:ln_matched == 0
		let s:search_term = deepcopy(s:search_term_orig)
		"#t: echo "Complete search ".s:search_term_orig." is not found. Seach ".s:search_term." instead."
		let s:ln_matched = search(s:search_term,'W')
		if s:ln_matched == 0
			let s:ln_last = line('$')
			call setpos('.',s:current_cusor)
			redraw
			echo "No string {".s:search_term."} is found"
		endif
  endif

  while s:ln_matched != 0
		if s:ln_matched - s:ln_last > 2 
			call add(s:fold_position,[s:ln_last,s:ln_matched-1])
		endif
		"?:deepcopy;no:-assume-:?$result; #er <= if s:ln_matched == line('$') is true:solved
		let s:ln_last = deepcopy(s:ln_matched+1) 
		let s:ln_matched = search(s:search_term,'W')
  endwhile
  "#Bug: if match happened at the last line, do not add it
  if s:ln_last < line('$')
		call add(s:fold_position,[s:ln_last,line('$')]) 
  endif
  "#c: eliminate all folds
  execute 'normal! zE'  
  "#a: activate highlight
  "#c: execute '/'.s:search_term.'/'

  if len(s:fold_position) > 0
		for item in s:fold_position
			execute item[0].','.item[1].'fold'
			"#c: echo item[0].','.item[1].'fold'
		endfor
  endif
	let @/=s:search_term
	call setpos('.',s:current_cusor)
endfunction

