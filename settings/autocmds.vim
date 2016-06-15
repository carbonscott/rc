autocmd filetype c,cpp,hpp,h :set cindent 
autocmd filetype c,cpp,hpp,h :set formatoptions+=j
""select paragraphs and press "gq"
"======= markdwon textwidth & colorcolumn ========
autocmd BufRead,BufNewFile *.md :set textwidth=84 
autocmd BufRead,BufNewFile *.md :set colorcolumn=86 
autocmd BufRead,BufNewFile *.md :set sw=2 
autocmd BufNewFile,BufRead *.md :set filetype=markdown
autocmd BufNewFile,BufRead *.md :source ~/.vim/settings/ThoughtRCColor.vim
autocmd BufNewFile,BufRead *.txt :set filetype=txt
autocmd BufNewFile,BufRead *.txt :source ~/.vim/settings/ThoughtRCColor.vim
autocmd BufNewFile,BufRead *.md :hi Error NONE
"autocmd FileType markdown :set colorcolumn=86 
"autocmd FileType markdown :source ~/.vim/settings/highlightmd.vim
"=======================================


