" ~~~~Global BufEnter event~~~~
" Save window state
function <SID>save_win_state()
    if  !exists('g:winview_dict')
        let g:winview_dict = {}
    endif

    " [COMPATIBLE] Compatiable with vim 7.4
    let bufnr = bufnr("%")
    let g:winview_dict[bufnr] = winsaveview()
endfunction

" Load window state
function <SID>load_win_state()
    if  !exists('g:winview_dict')
        let g:winview_dict = {}
    endif

    " [COMPATIBLE] Compatiable with vim 7.4
    let bufnr = bufnr("%")
    if has_key(g:winview_dict, bufnr)
        let winview = g:winview_dict[bufnr]
        call winrestview(winview)
    endif
endfunction
augroup WinState
    autocmd!
    autocmd BufEnter * call <SID>load_win_state()
    autocmd BufLeave * call <SID>save_win_state()
augroup END


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
    autocmd BufEnter *.md set filetype=markdown
    autocmd BufEnter *.md execute "set textwidth=80" 
    autocmd BufEnter *.md syntax on
    autocmd BufEnter *.md execute "hi markdownItalic cterm=None" 
    autocmd BufEnter *.md execute "hi markdownError  cterm=None" 
    autocmd BufEnter *.md if hlexists('markdownCodeBlock') | syntax clear markdownCodeBlock | endif
    autocmd BufEnter *.md source $HOME/.vim/syntax/review.vim
    autocmd BufEnter *.md redraw
    autocmd BufEnter *.md echom 'markdown file detected...'
augroup END


" Org file (my todo stuff)...
if v:version >= 800
    augroup MarkdownSetupPlus
        autocmd BufEnter *.org set filetype=markdown textwidth=0
        autocmd BufEnter *.org execute "set textwidth=80" 
        autocmd BufEnter *.org syntax on
        autocmd BufEnter *.org execute "hi markdownItalic cterm=None" 
        autocmd BufEnter *.org execute "hi markdownError  cterm=None" 
        autocmd BufEnter *.org source $HOME/.vim/syntax/org.vim
        autocmd BufEnter *.org redraw
        autocmd BufEnter *.org echom 'org file detected...'
    augroup END
endif


" LaTeX...
augroup LaTeXSetup
    autocmd! 
    autocmd BufEnter *.tex set filetype=tex
    autocmd BufEnter *.tex execute "set textwidth=80" 
    autocmd BufEnter *.tex syntax on
    autocmd BufEnter *.tex set shiftwidth=4
    autocmd BufEnter *.tex set wildignore+=*.log,*.pdf,*.aux
    autocmd BufEnter *.tex if hlexists('texItalStyle')     | syntax clear texItalStyle     | endif
    autocmd BufEnter *.tex if hlexists('texBoldItalStyle') | syntax clear texBoldItalStyle | endif
    autocmd BufEnter *.tex if hlexists('texItalBoldStyle') | syntax clear texItalBoldStyle | endif
    autocmd BufEnter *.tex if hlexists('texOnlyMath')      | syntax clear texOnlyMath      | endif
    autocmd BufEnter *.tex redraw
    autocmd BufEnter *.tex echom 'TeX file detected...'
    autocmd BufLeave *.tex set wildignore-=*.log,*.pdf,*.aux
augroup END


" Python...
augroup PythonSetup
    autocmd! 
    autocmd BufEnter *.py set shiftwidth=4

    " Turn off loading filetype related plugin for python
    autocmd BufEnter *.py let b:did_ftplugin=1
augroup END
