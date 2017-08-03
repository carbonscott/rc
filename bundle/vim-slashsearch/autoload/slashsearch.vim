function! <SID>Slashsearch()
				let current_line = getpos('.')
				let search_token = "\\%".current_line[1]."l"
				return search_token
endfunction

nnoremap [f /<c-r>=<SID>Slashsearch()<cr>
nnoremap [d ?<c-r>=<SID>Slashsearch()<cr>
vnoremap [f /<c-r>=<SID>Slashsearch()<cr>
vnoremap [d ?<c-r>=<SID>Slashsearch()<cr>
sunmap [f
sunmap [d
