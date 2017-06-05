function! <SID>Slashsearch()
				let current_line = getpos('.')
				let search_token = "\\%".current_line[1]."l"
				return search_token
endfunction

nnoremap / /<c-r>=<SID>Slashsearch()<cr>
nnoremap ? ?<c-r>=<SID>Slashsearch()<cr>
