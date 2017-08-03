function! <SID>Slashsearch()
				let current_line = getpos('.')
				let search_token = "\\%".current_line[1]."l"
				return search_token
endfunction

nnoremap ff /<c-r>=<SID>Slashsearch()<cr>
nnoremap fe ?<c-r>=<SID>Slashsearch()<cr>
vnoremap ff /<c-r>=<SID>Slashsearch()<cr>
vnoremap fe ?<c-r>=<SID>Slashsearch()<cr>
sunmap ff
sunmap fe
