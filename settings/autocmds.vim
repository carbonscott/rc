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
    autocmd BufEnter *.md source $HOME/.vim/syntax/org.vim

    autocmd BufEnter *.md syntax match pomodoro_done     "\[[xX]\].*$"
    autocmd BufEnter *.md syntax match pomodoro_comment  "\[[cC]\].*$"
    autocmd BufEnter *.md syntax match pomodoro_pause    "\[0\].*$"
    autocmd BufEnter *.md syntax match pomodoro_progress "\[1\].*$"
    autocmd BufEnter *.md highlight pomodoro_done     ctermfg=2  cterm=italic,strikethrough
    autocmd BufEnter *.md highlight pomodoro_comment  ctermfg=7  cterm=italic
    autocmd BufEnter *.md highlight pomodoro_pause    ctermfg=7  cterm=inverse
    autocmd BufEnter *.md highlight pomodoro_progress ctermfg=3  cterm=bold,inverse
augroup END

" LaTeX...
augroup LaTeXSetup
    autocmd! 
    autocmd BufEnter *.tex execute "set textwidth=80" 
    autocmd BufEnter *.tex echom 'TeX file detected...'
    autocmd BufEnter *.tex syntax on
    autocmd BufEnter *.tex set shiftwidth=4
    "autocmd BufEnter *.tex execute "hi markdownItalic cterm=None"
    "autocmd BufEnter *.tex execute "hi markdownError  cterm=None"
augroup END
