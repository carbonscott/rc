highlight CMT ctermfg=magenta 
highlight TRI ctermfg=blue 

let g:SmartInsertCommentOn = 0
let g:SmartInsertPlaceholder = "____"

let g:SmartInsertTempalte = expand("<sfile>:p:h:h")."/template/template.vim"

let g:IsLoadedSmartInsert = 0
" This function is used to read all keywords in the template file.
function! ReadAndComplete()
				let g:SmartInsertKeywords = []
				let keyword_pattern = "|".".*"."|"

				let file_array = readfile(g:SmartInsertTempalte)

				let comment_str = "^\s*#"
				call filter(file_array,'v:val!~comment_str')

				let keywords = []
				for item in file_array
								let matched_str = matchstr(item,keyword_pattern)
								call add(keywords,strpart(matched_str,1,len(matched_str)-2))
				endfor
				call filter(keywords,'v:val !~ "^\s*$"')
				call uniq(sort(keywords))

				let g:SmartInsertKeywords = keywords
				let g:IsLoadedSmartInsert = 1
				
				return
endfunction

" This function is used to prompt the warning information!
function! WarningWithColor(info,color)
				execute 'echohl '.a:color
				echon  a:info
				execute 'echohl NONE'
endfunction

" This function will be in use if the keyword is matched in the current line.
function! ReadTemplate(trigger)
				let to_search = "|".a:trigger."|"
				let file_array = readfile(g:SmartInsertTempalte)

				" offset line number due to comment...
				let comment_str = "^\s*#"
				call filter(file_array,'v:val!~comment_str')

				" if duplicate term exists...
				let if_dup = len(filter(copy(file_array),'v:val=~to_search'))
				if if_dup > 1
								call WarningWithColor(
								\ "There are more than 1 snippet found which is
								\ related to <","CMT")
								call WarningWithColor("to_search","TRI")
								call WarningWithColor(">!","CMT")
								return ['']
				elseif if_dup < 1
								call WarningWithColor("Undefined snippet :<","CMT")
								call WarningWithColor("to_search","TRI")
								call WarningWithColor(">!","CMT")
								return [''] 
				else
								let i1 = match(file_array,to_search)
								let i2 = match(file_array[i1:],'endtemplate')
								let i2 += i1
								let expand_array = file_array[i1+1:i2-1]
								call map(expand_array,'v:val."\n"')
								return expand_array
				endif
endfunction

" This function is to do the smart insert.
function! SmartInsert()
				let current_line = getline('.')
				let pos_current_line = getpos('.')

				if g:IsLoadedSmartInsert == 0
								call ReadAndComplete()
				endif

				" keep checking if the keyword is in the line...
				let is_found = 0
				for keyword in g:SmartInsertKeywords
								if current_line =~ '^\s*'.keyword.'\s*$'
												" keyword is there...

												" go to file again to get the template...
												let keyword_template = ReadTemplate(keyword)
												if len(keyword_template) == 1 && keyword_template[0] ==# ''
																let is_found = 0
																break
												endif

												" manipulate text...
												" - position of the first non space char...
												let pos_ns = match(current_line,'\S') + 1

												" - start rewriting text...
												" -- turn off some options...
												let opt_indent  = &autoindent
												let &autoindent = 0
												let opt_formatoptions = &formatoptions
												let &formatoptions = ""

												" -- reformat text for the lines except the first one...
												if len(keyword_template) > 1
																let pad_space = repeat(" ",pos_ns - 1)
																let keyword_template[1:] = map(keyword_template[1:],
																																									\ 'pad_space.v:val')
												endif

												" -- insert text...
												execute "normal! " .pos_ns. "|"
												execute "normal! c$" . join(keyword_template,"")

												" -- recover options...
												let &autoindent = opt_indent
												let &formatoptions = opt_formatoptions

												" stop searching for the next one...
												let is_found = 1
												break
								endif
				endfor

				" read the template again to get the warning info...
				if is_found == 0
								let word_in_currentline = 
														\	matchstr(current_line,'\\S\\+')
								call ReadTemplate(word_in_currentline)
				endif

				" put cursor to the first matched result...
				if is_found == 1
								let pos_current_line[2] = 1    " set the cursor to be at 1st column...
								call setpos('.', pos_current_line)
								let if_match = search(g:SmartInsertPlaceholder)
								if if_match != 0
												execute "normal! "."v".(len(g:SmartInsertPlaceholder)-1)."lo"
								endif
				endif

				return
endfunction

inoremap [q <c-[>:call SmartInsert()<cr>

finish

--------------------------------------------------------------------------------


drawback
- SmartInsert  => let &fo-=ro
- SmartInsert2 => set noautoindent
- It cannot load itself in template files.
- No distinguish between perl_for and tcl_for etc. Different names have to be used.
- 
