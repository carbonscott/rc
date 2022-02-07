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
    autocmd BufEnter *.md execute "set textwidth=80" 
    autocmd BufEnter *.md echom 'markdown file detected...'
    autocmd BufEnter *.md syntax on
    autocmd BufEnter *.md execute "hi markdownItalic cterm=None" 
    autocmd BufEnter *.md execute "hi markdownError  cterm=None" 
augroup END


" Org file (my todo stuff)...
if v:version >= 800
    augroup MarkdownSetupPlus
        autocmd BufEnter *.org set filetype=markdown textwidth=0
        autocmd BufEnter *.org execute "set textwidth=80" 
        autocmd BufEnter *.org echom 'org file detected...'
        autocmd BufEnter *.org syntax on
        autocmd BufEnter *.org execute "hi markdownItalic cterm=None" 
        autocmd BufEnter *.org execute "hi markdownError  cterm=None" 
        autocmd BufEnter *.org source $HOME/.vim/syntax/org.vim
    augroup END
endif


" LaTeX...
augroup LaTeXSetup
    autocmd! 
    autocmd BufEnter *.tex execute "set textwidth=80" 
    autocmd BufEnter *.tex echom 'TeX file detected...'
    autocmd BufEnter *.tex syntax on
    autocmd BufEnter *.tex set shiftwidth=4
    autocmd BufEnter *.tex syntax clear texOnlyMath
augroup END


" Python...
augroup PythonSetup
    autocmd! 
    autocmd BufEnter *.py set shiftwidth=4

    " Turn off loading filetype related plugin for python
    autocmd BufEnter *.py let b:did_ftplugin=1
augroup END
