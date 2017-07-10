
let s:rootdir = glob("~/.vim/bundle/vim-notecolor/autoload")

let s:categories = {
\ 				'chemistry' : s:rootdir.'/chemistry-names.dict',
\ }

function! BuildList(filename)
				let s:words = readfile(a:filename)
				let s:words = uniq(s:words)
endfunction

function! HighlightWords(category)
				call BuildList(s:categories[a:category])
				let cursor_pos = getpos('.')

				let not_match_first = "\\(W:{\\)\\@<!"
				let not_match_second = "\\(}\\)\\@!"
				for word in s:words
								let word = substitute(word,"^\\s\\+","","g")
								let word = substitute(word,"#\.\*","","g")
								let word = substitute(word,"\\s\\+$","","g")
								execute '%s/'.not_match_first.word.not_match_second.'/'.'W:{'.word.'}'.'/ige'
				endfor
				redraw
				call setpos('.',cursor_pos)
endfunction

command! -nargs=0 HighlightChemistry call HighlightWords('chemistry')

finish
---------------------------

lysozyme
LYZ
bovine serum albumin
