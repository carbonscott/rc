function! <SID>Slashsearch()
				let current_line = getpos('.')
				let search_token = "\\%".current_line[1]."l"
				return search_token
endfunction

nnoremap f /<c-r>=<SID>Slashsearch()<cr>
nnoremap F ?<c-r>=<SID>Slashsearch()<cr>
vnoremap f /<c-r>=<SID>Slashsearch()<cr>
vnoremap F ?<c-r>=<SID>Slashsearch()<cr>
