" ~~~~turn off colorcolumn~~~~
function! DeleteMatchedColor()
				let items=getmatches()
				for item in items
								call matchdelete(item['id'])
				endfor
endfunction

" ~~~~syntax highlighting for document~~~~
" Markdown...
augroup MarkdownSetup
    autocmd! 
    autocmd BufEnter *.md call execute("set textwidth=80")
    autocmd BufEnter *.md echom 'markdown file detected...'
    autocmd BufEnter *.md syntax on
    autocmd BufEnter *.md call execute("hi markdownItalic cterm=None")
    autocmd BufEnter *.md call execute("hi markdownError  cterm=None")
    autocmd BufEnter *.md source $HOME/.vim/syntax/org.vim
augroup END

" LaTeX...
augroup LaTeXSetup
    autocmd! 
    autocmd BufEnter *.tex call execute("set textwidth=80")
    autocmd BufEnter *.tex echom 'TeX file detected...'
    autocmd BufEnter *.tex syntax on
    "autocmd BufEnter *.tex call execute("hi markdownItalic cterm=None")
    "autocmd BufEnter *.tex call execute("hi markdownError  cterm=None")
augroup END
