"====== file operation =====
"---- Perl ----
" augroup PerlSetup
" 	autocmd!
" 	" insert it above the line: `:0read` ...
" 	autocmd BufNewFile *.pl :0read ~/.vim/templates/perl_head.txt
" augroup END

"===== txt file expansion =====
" augroup TxtSetup
" 	autocmd!
" 	" use latex snippets if it is *.txt or *.md
" 	autocmd BufNewFile *.txt,*.md :source ~/.vim/templates/latex.vim
" 	autocmd BufRead *.txt,*.md :source ~/.vim/templates/latex.vim
" augroup END

" ~~~~turn off colorcolumn~~~~
function! DeleteMatchedColor()
				let items=getmatches()
				for item in items
								call matchdelete(item['id'])
				endfor
endfunction

augroup MarkdownSetup
    autocmd! 
    autocmd BufEnter *.md call execute("set textwidth=80")
    autocmd BufEnter *.md echom 'markdown file detected...'
    autocmd BufEnter *.md syntax on
    autocmd BufEnter *.md call execute("hi markdownItalic cterm=None")
    autocmd BufEnter *.md call execute("hi markdownError  cterm=None")
augroup END
