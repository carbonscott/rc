highlight CMT ctermfg=magenta 
highlight TRI ctermfg=blue 

let g:SmartInsertCommentOn = 0
let g:SmartInsertPlaceholder = "____"
let g:SmartInsertTempalte = []
let g:SmartInsertDir = expand("<sfile>:p:h:h")
let g:filenames = []
let g:IsLoadedSmartInsert = 0
let g:SmartInsertKeywords = []

function! CompSize(s1,s2)
				let l1 = strlen(a:s1)
				let l2 = strlen(a:s2)
				return l1 >= l2 ? l1 : l2
endfunction


" This function is used to read all keywords in the template file.
function! ReadAndComplete(leadword)
				let keyword_pattern = "|".".*"."|"

				" [TODO] Add beginning and end of line regex...
				let line_pattern = a:leadword."\\s\\+".keyword_pattern

				" read all template files...
				let file_array = []
				for each_file in g:SmartInsertTempalte
								call extend(file_array, readfile(each_file))
				endfor

				" set up the syntax for comment...
				let comment_str = "^\s*#->"
				call filter(file_array,'v:val!~comment_str')

				let keywords = []
				for item in file_array
								let matched_line = matchstr(item,line_pattern)
								let matched_str = matchstr(matched_line,keyword_pattern)
								call add(keywords,strpart(matched_str,1,len(matched_str)-2))
				endfor
				call filter(keywords,'v:val !~ "^\s*$"')
				call uniq(sort(keywords,"CompSize"))

				call extend(g:SmartInsertKeywords, keywords)
				
				return
endfunction

" This function is used to prompt the warning information!
function! WarningWithColor(info,color)
				execute 'echohl '.a:color
				echon  a:info
				execute 'echohl NONE'
endfunction

function! BuildPrompt(filenames)
				let filenames = a:filenames
				let len_prompt = max(map(copy(filenames),'strlen(v:val)'))
				let delimiter = "+".repeat('-',len_prompt)."+"
				call map(filenames,'"|".v:val.repeat(" ",len_prompt - strlen(v:val))."|"')
				let filenames_prompt = [delimiter,delimiter]
				call extend(filenames_prompt,filenames,1)
				 
				let dialog = join(filenames_prompt,"\n")."\n".
															\ "choose template file: " 
				let target_file = input(dialog,"","customlist,CompleteTemplates")

				return target_file
endfunction

" This function will be in use if the keyword is matched in the current line.
function! ReadTemplate(trigger,leadword)
				" use double quotes...
				let BEGIN_LINE = "^\\s*"
				let END_LINE = "\\s*$"

				let to_search = BEGIN_LINE.a:leadword."\\s\\+"."|".a:trigger."|".END_LINE

				" read all template files...
				let file_array = []
				for each_file in g:SmartInsertTempalte
								call extend(file_array, readfile(each_file))
				endfor

				" offset line number due to comment...
				let comment_str = "^\s*#->"
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

" This function is to implement the smart insert...
function! SmartInsert()
				let current_line = getline('.')
				let pos_current_line = getpos('.')

				if g:IsLoadedSmartInsert == 0
								let g:SmartInsertKeywords = []
								" call ReadAndComplete("template")
								call ReadAndComplete("\\("."template"."\\|"."metatemplate"."\\)")
				endif

				" keep checking if the keyword is in the line...
				let is_found = 0
				for keyword in g:SmartInsertKeywords

								" [TODO] The regex can be put into one variable...
								" [DEBUG, Memo, Yep] if current_line =~ '^\s*'.keyword.'\s*$'
								if current_line =~ '^.*'.keyword.'$'
												" keyword is there...

												" go to file again to get the template...
												let keyword_template = ReadTemplate(keyword,"metatemplate")
												if len(keyword_template) == 1 && keyword_template[0] ==# ''

																" After second level check for template, if nothing is
																" found, stop searching...
																let keyword_template = ReadTemplate(keyword,"template")
																if len(keyword_template) == 1 && keyword_template[0] ==# ''
																				let is_found = 0
																				break
																endif

												endif

												" manipulate text...
												" - position of the first letter in keyword...
												let keyword_length = len(keyword)
												let pos_ns = pos_current_line[2] - keyword_length + 1

												" - start rewriting text...
												" -- turn off some options...
												let opt_indent  = &autoindent
												let &autoindent = 0
												let opt_formatoptions = &formatoptions
												let &formatoptions = ""
												let opt_tabstop = &tabstop
												let &tabstop = 1

												" -- reformat text for the lines except the first one...
												if len(keyword_template) > 1
																"// [TESTING] 
																"// a tab character	i_ctrl_v <tab> is inserted...
																let pad_space = repeat("	",pos_ns - 1)
																let keyword_template[1:] = map(keyword_template[1:],
																																									\ 'pad_space.v:val')
												endif

												" -- insert text...
												" * last line is to make sure there's no extra line added...
												" * k is fine because at least there's text inserted from the 
												" current line
												execute "normal! " .pos_ns. "|"
												execute "normal! c$" . join(keyword_template,"")
												execute "normal! kJ"

												" -- count the number of placeholders...
												let is_placeholder = match(keyword_template, g:SmartInsertPlaceholder)

												" -- recover options...
												let &autoindent = opt_indent
												let &formatoptions = opt_formatoptions
												let &tabstop = opt_tabstop

												" stop searching for the next one...
												let is_found = 1
												break
								endif
				endfor

				" read the template again to get the warning info...
				if is_found == 0
								let word_in_currentline = 
														\	matchstr(current_line,"\\S.*$")
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

function! ClearKeywords()
				let g:SmartInsertKeywords = []
endfunction

function! ClearTemplates()
				let g:SmartInsertTempalte = []
endfunction

function! ShowTemplates()
				let prefix_dir = g:SmartInsertDir
				let template_dir = '/template/'
				let template_files = '*-template.vim'
				let all_matched_files = glob(prefix_dir.template_dir.template_files,0,1)
				let g:filenames = []
				for each_file in all_matched_files
								let subname = strpart(each_file,strlen(prefix_dir.template_dir))
								call add(g:filenames, subname)
				endfor
endfunction

function! CreateTemplates()
				let prefix_dir = g:SmartInsertDir
				let template_dir = '/template/'
				let new_filename = input("Create new file: ")
				let template_file = new_filename.'-template.vim'
				let absolute_filename = prefix_dir.template_dir.template_file

				" if it doesn't exists, tabnew! it
				" otherwise, edit it...
				let all_matched_files = glob(absolute_filename,0,1)
				if len(all_matched_files) == 0
								execute "tabedit! " . absolute_filename
				else
								redraw
								call WarningWithColor( "Template <".template_file."> already exists.", "CMT")
				endif

endfunction

function! EditTemplates()
				call ShowTemplates()
				redraw

				let filenames = deepcopy(g:filenames)
				if empty(filenames)
								call WarningWithColor( "No template is selected.", "CMT")
								return
				endif
				let target_file = BuildPrompt(filenames)
				
				if target_file == ""
								redraw
								call WarningWithColor("No template is selected.","CMT")
								return
				endif

				let prefix_dir = g:SmartInsertDir
				let template_dir = '/template/'
				let new_filename = target_file
				let template_file = new_filename
				let absolute_filename = prefix_dir.template_dir.template_file

				let all_matched_files = glob(absolute_filename,0,1)
				if len(all_matched_files) != 0
								execute "tabedit! " . absolute_filename
				else
								redraw
								call WarningWithColor( "Template <".template_file."> doesn't exists.", "CMT")
				endif

endfunction

function! ShowSelectedTemplates()
				let filenames = deepcopy(g:SmartInsertTempalte)
				if empty(filenames)
								call WarningWithColor( "No template is selected.", "CMT")
								return
				endif

				let len_prompt = max(map(copy(filenames),'strlen(v:val)'))
				let delimiter = "+".repeat('-',len_prompt)."+"
				call map(filenames,'"|".v:val.repeat(" ",len_prompt - strlen(v:val))."|"')
				let filenames_prompt = [delimiter,delimiter]
				call extend(filenames_prompt,filenames,1)
				 
				let dialog = join(filenames_prompt,"\n") 
				echo dialog
endfunction

function! CompleteTemplates(A,L,P)
				return filter(copy(g:filenames),'v:val =~ a:A')
endfunction

function! DeleteSelectedTemplates()
				call ClearKeywords()

				let filenames = deepcopy(g:SmartInsertTempalte)
				if empty(filenames)
								call WarningWithColor( "No template is selected.", "CMT")
								return
				endif

				let target_file = BuildPrompt(filenames)
				
				if target_file == ""
								redraw
								call WarningWithColor("No template is selected.","CMT")
								return
				endif

				let all_files = split(target_file," ")
				let prefix_dir = g:SmartInsertDir
				let template_dir = '/template/'
				call map(all_files, 'prefix_dir.template_dir.v:val')

				let target_files = []
				for each_file in all_files
								if getfsize(each_file) != -1
												call add(target_files,each_file)
								endif
				endfor

				if !empty(target_files)
								call filter(g:SmartInsertTempalte,'v:val !~ target_files[0]')
				endif 

				return
endfunction

function! SelectTemplates()
				call ShowTemplates()
				redraw

				let filenames = deepcopy(g:filenames)
				let target_file = BuildPrompt(filenames)
				
				if target_file == ""
								redraw
								call WarningWithColor("No template is selected.","CMT")
								return
				endif

				let all_files = split(target_file," ")
				let prefix_dir = g:SmartInsertDir
				let template_dir = '/template/'
				call map(all_files, 'prefix_dir.template_dir.v:val')

				let target_files = []
				for each_file in all_files
								if getfsize(each_file) != -1
												call add(target_files,each_file)
								endif
				endfor

				" remove template if it's already loaded...
				call
				\			filter(g:SmartInsertTempalte,'v:val !~ target_file')

				call extend(g:SmartInsertTempalte,target_files)

				return
endfunction

function! ListSmartKeywords(findstart, base)
				if a:findstart
							 " locate the start of the word
							 let line = getline('.')
							 let start = col('.') - 1
							 while start > 0 && line[start - 1] =~ '\a'
							 		let start -= 1
							 endwhile
							 return start
				else
								if g:IsLoadedSmartInsert == 0
												let g:SmartInsertKeywords = []
												call ReadAndComplete("\\("."template"."\\|"."metatemplate"."\\)")
								endif

							 " find keywords matching with "a:base"
							 for m in g:SmartInsertKeywords
							 		  if m =~ '^' . a:base
																call complete_add(m)
							 		  endif
							 		  if complete_check()
																break
							 		  endif
							 endfor
							 return []
					endif
endfunction



inoremap [q <c-[>:call SmartInsert()<cr>
command! -nargs=0 ClearKeywords  call ClearKeywords()
command! -nargs=0 ClearTemplates  call ClearTemplates()
command! -nargs=0 ShowSelectedTemplates  call ShowSelectedTemplates()
command! -nargs=0 SelectTemplates  call SelectTemplates()
command! -nargs=0 DeleteSelectedTemplates  call DeleteSelectedTemplates()
command! -nargs=0 CreateTemplates  call CreateTemplates()
command! -nargs=0 EditTemplates call EditTemplates()

" looking for placeholder g:SmartInsertPlaceholder 
nnoremap <silent> [j :call search(g:SmartInsertPlaceholder)<cr>
																				\:execute "normal! v".(len(g:SmartInsertPlaceholder)-1)."lo\<c-g>"<cr>
snoremap <silent> [j :<c-u>call search(g:SmartInsertPlaceholder)<cr>
																				\:execute "normal! v".(len(g:SmartInsertPlaceholder)-1)."lo\<c-g>"<cr>
vnoremap <silent> [j :<c-u>call search(g:SmartInsertPlaceholder)<cr>
																				\:execute "normal! v".(len(g:SmartInsertPlaceholder)-1)."lo\<c-g>"<cr>

nnoremap <silent> [k :call search(g:SmartInsertPlaceholder,'b')<cr>
																				\:execute "normal! v".(len(g:SmartInsertPlaceholder)-1)."lo\<c-g>"<cr>
snoremap <silent> [k :<c-u>call search(g:SmartInsertPlaceholder,'b')<cr>
																				\:execute "normal! v".(len(g:SmartInsertPlaceholder)-1)."lo\<c-g>"<cr>
vnoremap <silent> [k :<c-u>call search(g:SmartInsertPlaceholder,'b')<cr>
																				\:execute "normal! v".(len(g:SmartInsertPlaceholder)-1)."lo\<c-g>"<cr>

inoremap <silent> [j <c-[>
																				\:call search(g:SmartInsertPlaceholder)<cr>
																				\:execute "normal! v".(len(g:SmartInsertPlaceholder)-1)."lo\<c-g>"<cr>
inoremap <silent> [k <c-[>
																				\:call search(g:SmartInsertPlaceholder,'b')<cr>
																				\:execute "normal! v".(len(g:SmartInsertPlaceholder)-1)."lo\<c-g>"<cr>

" list smart keywords...
set completefunc=ListSmartKeywords

" quickly select the named placeholder...
snoremap [i <c-g>F$<c-g>
vnoremap [i F$<c-g>

" Quickly launch loader...
nnoremap [tl :SelectTemplates<cr>
nnoremap [td :DeleteSelectedTemplates<cr>
nnoremap [te :EditTemplates<cr>
nnoremap [tc :CreateTemplates<cr>
inoremap [tl <c-o>:SelectTemplates<cr>
inoremap [td <c-o>:DeleteSelectedTemplates<cr>
inoremap [te <c-o>:EditTemplates<cr>
inoremap [tc <c-o>:CreateTemplates<cr>

finish

--------------------------------------------------------------------------------


drawback
- SmartInsert  => let &fo-=ro
- SmartInsert2 => set noautoindent
- It cannot load itself in template files.
- No distinguish between perl_for and tcl_for etc. Different names have to be used.
  
" previous keybinds...
nnoremap <silent> [j :call search('____')<CR>ve<c-g>
snoremap <silent> [j :<c-u>call search('____')<CR>ve<c-g>
vnoremap <silent> [j :<c-u>call search('____')<CR>ve<c-g>

nnoremap <silent> [k :call search('____','b')<CR>ve<c-g>
snoremap <silent> [k :<c-u>call search('____','b')<CR>ve<c-g>
vnoremap <silent> [k :<c-u>call search('____','b')<CR>ve<c-g>

inoremap <silent> [j <c-[>:call search('____')<CR>ve<c-g>
inoremap <silent> [k <c-[>:call search('____','b')<CR>ve<c-g>
