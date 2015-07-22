autocmd filetype c,cpp,hpp,h :set cindent 
""select paragraphs and press "gq"
"======= markdwon textwidth & colorcolumn ========
autocmd BufRead,BufNewFile *.md set textwidth=84 
autocmd BufRead,BufNewFile *.md set colorcolumn=86 
autocmd BufRead,BufNewFile *.md set sw=2 
autocmd FileType markdown set colorcolumn=86 
autocmd BufNewFile,BufRead *.md set filetype=markdown
"=======================================


