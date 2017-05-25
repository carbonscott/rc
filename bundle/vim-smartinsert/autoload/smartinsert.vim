highlight CMT ctermfg=magenta 
highlight TRI ctermfg=blue 

let g:SmartInsertCommentOn = 0
let g:SmartInsertPlaceholder = "____"

let g:SmartInsertTempalte = expand("<sfile>:p:h:h")."/template/template.vim"

let g:IsLoadedSmartInsert = 0

" This function is used to read all keywords in the template file.
function! ReadAndComplete(leadword)
				let g:SmartInsertKeywords = []
				let keyword_pattern = "|".".*"."|"

				" [TODO] Add beginning and end of line regex...
				let line_pattern = a:leadword."\\s\\+".keyword_pattern

				let file_array = readfile(g:SmartInsertTempalte)

				let comment_str = "^\s*#"
				call filter(file_array,'v:val!~comment_str')

				let keywords = []
				for item in file_array
								let matched_line = matchstr(item,line_pattern)
								let matched_str = matchstr(matched_line,keyword_pattern)
								call add(keywords,strpart(matched_str,1,len(matched_str)-2))
				endfor
				call filter(keywords,'v:val !~ "^\s*$"')
				call uniq(sort(keywords))

				" let g:SmartInsertKeywords = keywords
				call extend(g:SmartInsertKeywords, keywords)
				" let g:IsLoadedSmartInsert = 1
				
				return
endfunction

" This function is used to prompt the warning information!
function! WarningWithColor(info,color)
				execute 'echohl '.a:color
				echon  a:info
				execute 'echohl NONE'
endfunction

" This function will be in use if the keyword is matched in the current line.
function! ReadTemplate(trigger,leadword)
				" use double quotes...
				let BEGIN_LINE = "^\\s*"
				let END_LINE = "\\s*$"

				let to_search = BEGIN_LINE.a:leadword."\\s\\+"."|".a:trigger."|".END_LINE
				let file_array = readfile(g:SmartInsertTempalte)

				" offset line number due to comment...
				let comment_str = "^\s*#"
				call filter(file_array,'v:val!~comment_str')

				" if duplicate term exists...
				let if_dup = len(filter(copy(file_array),'v:val=~to_search'))
				if if_dup > 1
								redraw
								call WarningWithColor(
								\ "There are more than 1 snippet found which is
								\ related to <","CMT")
								call WarningWithColor(a:trigger,"TRI")
								call WarningWithColor(">!","CMT")
								return ['']
				elseif if_dup < 1
								redraw
								call WarningWithColor("Undefined snippet :<","CMT")
								call WarningWithColor(a:trigger,"TRI")
								call WarningWithColor(">!","CMT")
								return [''] 
				else
								let i1 = match(file_array,to_search)
								let i2 = match(file_array[i1:], BEGIN_LINE."end".a:leadword.END_LINE)
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
								" call ReadAndComplete("template")
								call ReadAndComplete("\\("."template"."\\|"."metatemplate"."\\)")
				endif

				" keep checking if the keyword is in the line...
				let is_found = 0
				for keyword in g:SmartInsertKeywords

								" [TODO] The regex can be put into one variable...
								if current_line =~ '^\s*'.keyword.'\s*$'
												" keyword is there...

												" go to file again to get the template...
												let keyword_template = ReadTemplate(keyword,"metatemplate")
												if len(keyword_template) == 1 && keyword_template[0] ==# ''

																" After second level check for template, if nothing is
																" found, stop " searching...
																let keyword_template = ReadTemplate(keyword,"template")
																if len(keyword_template) == 1 && keyword_template[0] ==# ''
																				let is_found = 0
																				break
																endif

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

												" -- count the number of placeholders...
												let is_placeholder = match(keyword_template, g:SmartInsertPlaceholder)

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
														\	matchstr(current_line,"\\S.*\\S")
								redraw
								let g:DEBUG = word_in_currentline
								call ReadTemplate(word_in_currentline,"template")
				endif

				" put cursor to the first matched result...
				if is_found == 1
								let pos_current_line[2] = 1    " set the cursor to be at 1st column...
								call setpos('.', pos_current_line)

								" if there's at least one place holder...
								if is_placeholder != -1 
												let if_match = search(g:SmartInsertPlaceholder,'c')
												if if_match != 0
																execute "normal! "."v".(len(g:SmartInsertPlaceholder)-1)."lo\<c-g>"
												endif
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
