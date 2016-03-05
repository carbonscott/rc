vnoremap <expr> <LEFT> moveblock#mb('left')
vnoremap <expr> <RIGHT> moveblock#mb('right')
vnoremap <UP> :call moveblock#swapline('up')<CR>
   		\:normal! gvkoko<CR>
vnoremap <DOWN> :call moveblock#swapline('down')<CR>
   		\:normal! gvjojo<CR>
