"# How many ways of inserting text...
"# execute normal! r."text"

"# template
"# foreach my ____ (____) {
"#     ____
"# }

highlight CMT ctermfg=magenta 
highlight TRI ctermfg=blue 

let g:SmartInsertCommentOn = 1

function! ReadTemplate(trigger)
				let to_search = "|".a:trigger."|"

				let file_array = readfile("template.vim")

				" offset line number due to comment...
				let comment_str = "^\s*#"
				call filter(file_array,'v:val!~comment_str')

				" if duplicate term exists...
				let if_dup = len(filter(copy(file_array),'v:val=~to_search'))
				if if_dup > 1
								echohl CMT
								echon "There are more than 1 snippet found which is
								\ related to <"
								echohl TRI
								echon  to_search
								echohl CMT
								echon  ">!"
								echohl NONE
								return 
				elseif if_dup < 1
								echohl CMT
								echon "Undefined snippet :<"
								echohl TRI
								echon  to_search
								echohl CMT
								echon  ">!"
								echohl NONE
								return 
				else
								let i1 = match(file_array,to_search)
								let i2 = match(file_array[i1:],'endtemplate')
								let i2 += i1
								let expand_array = file_array[i1+1:i2-1]
								return expand_array
				endif
endfunction

" call ReadTemplate("cfor")

let s:SI_DEBUG = 1
if s:SI_DEBUG == 1
function! SmartInsert(trigger)

				let foreach_str = ReadTemplate(a:trigger)
				if len(foreach_str) == 1
								return
				endif 

				let current_pos = getpos('.')
				" echo current_pos[2]
				let current_pos[2] -= g:SmartInsertCommentOn
				let current_col = current_pos[2]
				" echo current_col

				let pad_space = repeat(" ",current_col)
				
				let foreach_str[0] .="\n"
				let foreach_str[1:] = map(foreach_str[1:],'pad_space.v:val."\n"')

				set formatoptions-=ro
				for item in foreach_str
								execute "normal! "."i".item
				endfor
				set formatoptions+=ro

endfunction

call SmartInsert('latex_table')
" call SmartInsert('tcl_for')
endif
finish
												
