" Copyright (c) 2020 Cong Wang
" 
" MIT License
" 
" Permission is hereby granted, free of charge, to any person obtaining
" a copy of this software and associated documentation files (the
" "Software"), to deal in the Software without restriction, including
" without limitation the rights to use, copy, modify, merge, publish,
" distribute, sublicense, and/or sell copies of the Software, and to
" permit persons to whom the Software is furnished to do so, subject to
" the following conditions:
" 
" The above copyright notice and this permission notice shall be
" included in all copies or substantial portions of the Software.
" 
" THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
" EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
" MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
" NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
" LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
" OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
" WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.


" If already loaded, we're done...
if exists("loaded_SmartInsert")
    finish
endif
let loaded_SmartInsert = 1


let s:cpo_save = &cpo
set cpo&vim


" [[[ Implementation ]]]

" Colors used for the prompt...
highlight CMT ctermfg=magenta 
highlight TRI ctermfg=blue 


" Set global variables for the plugin...
let g:SmartInsertCommentOn = 0
let g:SmartInsertPlaceholder = '_\{2\}\(.\{-\}\)_\{2\}'
let g:SmartInsertTemplate = []
let g:SmartInsertDir = expand("<sfile>:p:h")
let g:filenames = []
let g:IsLoadedSmartInsert = 0
let g:SmartInsertKeywords = []


" [[[ Utilities ]]]
function! MinFirst(s1,s2)
    let l1 = strlen(a:s1)
    let l2 = strlen(a:s2)
    return l1 >= l2 ? 1 : -1
endfunction




function! MaxFirst(s1,s2)
    let l1 = strlen(a:s1)
    let l2 = strlen(a:s2)
    return l1 >= l2 ? -1 : 1
endfunction




function! ReadAndComplete(leadword)
    " This function is used to read all keywords in the template file.
    let keyword_pattern = "|".".*"."|"

    " [TODO] Add beginning and end of line regex...
    let line_pattern = a:leadword."\\s\\+".keyword_pattern

    " read all template files...
    let file_array = []
    for each_file in g:SmartInsertTemplate
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
    call uniq(sort(keywords,"MaxFirst"))

    call extend(g:SmartInsertKeywords, keywords)
    
    return
endfunction




function! WarningWithColor(info,color)
    " This function is used to prompt the warning information!
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




function! ReadTemplate(trigger,leadword)
    " This function will be in use if the keyword is matched in the current line.

    " use double quotes...
    let BEGIN_LINE = "^\\s*"
    let END_LINE = "\\s*$"

    let trigger = a:trigger
    let g:debug_trigger = a:trigger
    let to_search = BEGIN_LINE.a:leadword."\\s\\+"."|".trigger."|".END_LINE
    let g:debug_to_search = to_search

    " read all template files...
    let file_array = []
    for each_file in g:SmartInsertTemplate
        call extend(file_array, readfile(each_file))
    endfor
    let g:debug_file_array = file_array

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
        call WarningWithColor(trigger,"TRI")
        call WarningWithColor(">!","CMT")
        return ['']
    elseif if_dup < 1
        redraw
        call WarningWithColor("Undefined snippet :<","CMT")
        call WarningWithColor(trigger,"TRI")
        call WarningWithColor(">!","CMT")
        return [''] 
    else
        let i1 = match(file_array,to_search)

        "// for Vim 7.4 ⇒ A weird error, I have to leave a space between index i1 and :
        let i2 = match(file_array[i1 :], BEGIN_LINE."end".a:leadword.END_LINE)
        let i2 += i1
        let expand_array = file_array[i1+1:i2-1]
        call map(expand_array,'v:val."\n"')
        return expand_array
    endif
endfunction




function! SmartInsert()
    " This function is to implement the smart insert...

    " Get line context
    " - Read current cursor position...
    let pos_current_line = getpos('.')

    " - Insert a whitespace to get the cursor position next to it...
    execute "normal! a "
    let pos_current_line_right = getpos('.')
    execute "normal! dl"
    call setpos('.', pos_current_line)

    " Get effective information...
    " - read the current line
    let current_line = getline('.')

    " - Slice the string for current line...
    "   no need to use deepcopy when data is sliced;
    "   the following is an alternative way, but let me stick to strpart();
    "   the last index should be off by 1;
    let current_line_sliced = strpart(current_line, 0, pos_current_line_right[2]-1)

    " [debug]
    let g:current_line_sliced = current_line_sliced

    if g:IsLoadedSmartInsert == 0
        let g:SmartInsertKeywords = []
        call ReadAndComplete("\\("."template"."\\|"."metatemplate"."\\)")
    endif

    " Turn off advanced features that move characters...
    let opt_indentkeys = &indentkeys
    let &indentkeys=""

    " Keep checking if the keyword is in the line...
    let is_found = 0
    for each_keyword in g:SmartInsertKeywords
        let keyword = escape(each_keyword,'.\')

        " [TODO] The regex can be put into one variable...
        if current_line_sliced =~ '^.*'.keyword.'$'
            let g:debug_keyword = keyword

            " Keyword is there...
            "   Test if curosr is next to the keyword;
            "   Start to search from the current keyword;
            call search(keyword,'bc')
            let pos_keyword_inline = getpos('.')
            let keyword_length = strlen(keyword)
            let real_keyword_length = pos_current_line[2] - pos_keyword_inline[2] + 1
            if real_keyword_length < 0 
                " [debug]
                let real_keyword_length = ""
            endif

            if pos_current_line[2] - pos_keyword_inline[2] >= keyword_length
                continue
            endif

            " Go to file again to get the template...
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

            " Manipulate text...
            " position of the first letter in keyword;
            let pos_ns = pos_current_line[2] - real_keyword_length + 1

            " [insertion algorithm]
            " last line is to make sure there's no extra line added;
            " k is fine because at least there's text inserted from the current line;
            " deepcopy is necessary;
            let jump_to_first = deepcopy(pos_current_line)  
            let jump_to_first[2] = pos_ns         " set the cursor to be at the column where the keyword insertion starts...
            call setpos('.', jump_to_first)       

            " Delete the keyword;
            " Insert the first line in template;
            " [debug]
            let g:cmd = "normal! c".real_keyword_length."l" . keyword_template[0]
            " Find \n position, it's actually simply the last position;
            execute "normal! c".real_keyword_length."l" . keyword_template[0][:-2]

            " Reformat text for the lines except the first one...
            if len(keyword_template) > 1
                " Set the indentation...
                " Add spaces for indentation;
                let pad_space = repeat(' ', pos_ns - 1)
                let keyword_template[1:] = map(keyword_template[1:], 'pad_space.v:val')

                let g:keyword_template = keyword_template

                " Move cursor to the next line...
                for insert_line in keyword_template[1:]
                    " - Enter a char 0 to specify the position of cursor;
                    " - Find \n position, it's actually simply the last position;
                    " - Alternative is to use \<c-u>, but it will roll back to
                    "   the previous line if nothing to delete;
                    " execute "normal! o0"
                    execute "normal! o"
                    execute "normal! 0"
                    execute "normal! c$" . insert_line[:-2]
                    " Need to deal with indentkeys... 
                endfor
            endif

            " Count the number of placeholders...
            let is_placeholder = match(keyword_template, g:SmartInsertPlaceholder)

            " Stop searching for the next one...
            let is_found = 1
            break
        endif
    endfor

    " -- recover options...
    let &indentkeys = opt_indentkeys

    " read the template again to get the warning info...
    if is_found == 0
        let word_in_currentline = 
            \  matchstr(current_line_sliced,"\\S.*$")
        redraw
        let g:DEBUG = word_in_currentline
        call ReadTemplate(word_in_currentline,"template")

        " I want the cursor back, if nothing is inserted...
        call setpos('.',pos_current_line)
    endif

    " put cursor to the first matched result...
    if is_found == 1
        " if there's at least one place holder...
        if is_placeholder != -1 
            call setpos('.', jump_to_first)

            " [ISSUE] failed to search when the cursor is on placeholder
            " Keep the following code in case the fix creates new bug
            " ~~~ let match_left  = searchpos(g:SmartInsertPlaceholder, 'n') ~~~
            let match_left  = searchpos(g:SmartInsertPlaceholder, 'cn')
            let match_rght  = searchpos(g:SmartInsertPlaceholder, 'en')
            let match_len   = match_rght[1] - match_left[1]
            let g:match_len = match_len

            let if_match = search(g:SmartInsertPlaceholder,'c')
            if if_match != 0
              execute "normal! "."v".(match_len)."lo\<c-g>"
            endif
        else
            " move back to where cursors starts...
            call setpos('.', pos_current_line)
        endif
    endif

    return
endfunction




function! ClearKeywords()
    let g:SmartInsertKeywords = []
endfunction




function! ClearTemplates()
    let g:SmartInsertTemplate = []
endfunction




function! ShowTemplates()
    let prefix_dir = g:SmartInsertDir
    let template_dir = '/template/'
    let template_files = '*.template'
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
    let new_filename = input("Create a new file: ")
    let template_file = new_filename.'.template'
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
    let filenames = deepcopy(g:SmartInsertTemplate)
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

    let filenames = deepcopy(g:SmartInsertTemplate)
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
        call filter(g:SmartInsertTemplate,'v:val !~ target_files[0]')
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
    call filter(g:SmartInsertTemplate,'v:val !~ target_file')

    call extend(g:SmartInsertTemplate,target_files)

    return
endfunction




function! ListSmartKeywords(findstart, base)
    if a:findstart
        " locate the start of the word
        let line = getline('.')
        let start = col('.') - 1

        ". \S matches anything but a white space, so I can use 
        ". any character except whitespace in my keyword...
        while start > 0 && line[start - 1] =~ '\S'
          let start -= 1
        endwhile
        return start
    else
        if g:IsLoadedSmartInsert == 0
            let g:SmartInsertKeywords = []
            call ReadAndComplete("\\("."template"."\\|"."metatemplate"."\\)")
        endif

        " find keywords matching with "a:base"
        let base = escape(a:base,'.\')
        call sort(g:SmartInsertKeywords,"MinFirst")
        for m in g:SmartInsertKeywords
            if m =~ '^' . base
                call complete_add(m)
            endif
            if complete_check()
                break
            endif
        endfor
        return []
    endif
endfunction




function! NextPlaceholder(next_type)
    " Define types of movement...
    let next_rules = {
    \     'next' : '',
    \     'prev' : 'b'
    \ }

    " Find out the length of string matched by placeholder... 
    " See README.md for understanding order
    let match_left = searchpos(g:SmartInsertPlaceholder, 
    \                         'n'.next_rules[a:next_type])

    if a:next_type == 'next' 
        let if_match = search(g:SmartInsertPlaceholder,
        \                         ''.next_rules[a:next_type])
    endif

    let match_rght = searchpos(g:SmartInsertPlaceholder,
    \                         'en'.next_rules[a:next_type])

    let match_len  = match_rght[1] - match_left[1]

    if a:next_type == 'prev' 
        let if_match = search(g:SmartInsertPlaceholder,
        \                         ''.next_rules[a:next_type])
    endif

    " Visual select the string matched by placeholder...
    let cmd = ''
    if if_match != 0
        let cmd = "normal! " . "v" . (match_len) . "lo\<c-g>"
    endif

    execute cmd
endfunction




" Keybindings...
inoremap [q <c-[>:call SmartInsert()<cr>
command! -nargs=0 ClearKeywords            call ClearKeywords()
command! -nargs=0 ClearTemplates           call ClearTemplates()
command! -nargs=0 ShowSelectedTemplates    call ShowSelectedTemplates()
command! -nargs=0 SelectTemplates          call SelectTemplates()
command! -nargs=0 DeleteSelectedTemplates  call DeleteSelectedTemplates()
command! -nargs=0 CreateTemplates          call CreateTemplates()
command! -nargs=0 EditTemplates            call EditTemplates()

" Looking for placeholder g:SmartInsertPlaceholder 
nnoremap <silent> [j :call NextPlaceholder('next')<cr>
snoremap <silent> [j :<c-u>call NextPlaceholder('next')<cr>
vnoremap <silent> [j :<c-u>call NextPlaceholder('next')<cr>

nnoremap <silent> [k :call NextPlaceholder('prev')<cr>
snoremap <silent> [k :<c-u>call NextPlaceholder('prev')<cr>
vnoremap <silent> [k :<c-u>call NextPlaceholder('prev')<cr>

inoremap <silent> [j <c-[>h :call NextPlaceholder('next')<cr>
inoremap <silent> [k <c-[> :call NextPlaceholder('prev')<cr>

" list smart keywords...
set completefunc=ListSmartKeywords

" Quickly launch loader...
nnoremap [tl :SelectTemplates<cr>
nnoremap [td :DeleteSelectedTemplates<cr>
nnoremap [te :EditTemplates<cr>
nnoremap [tc :CreateTemplates<cr>
inoremap [tl <c-o>:SelectTemplates<cr>
inoremap [td <c-o>:DeleteSelectedTemplates<cr>
inoremap [te <c-o>:EditTemplates<cr>
inoremap [tc <c-o>:CreateTemplates<cr>

" shortcut to expand keywords...
inoremap <Tab> <c-x><c-u>
inoremap [n <c-x><c-u>

" Use desc as the value of __desc__ ...
" [Inconsistency]  g:SmartInsertPlaceholder
function! GetDefaultValue()
    let s_pos  = getpos('.')
    let s_col = s_pos[2] - 1
    let s_cmd  = 's/\%>' . s_col . 'c' . g:SmartInsertPlaceholder . '/\1/'
    execute s_cmd

    set nohlsearch
    call setpos('.', s_pos)
endfunction
snoremap <silent> <Tab> <c-[>:call GetDefaultValue()<cr>:call NextPlaceholder('next')<cr>


let &cpo = s:cpo_save
unlet s:cpo_save


finish
