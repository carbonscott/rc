nnoremap [f :echo " Try [ff, if you're trying to search."<cr>
nnoremap [e :echo " Try [ff, if you're trying to search."<cr>
nnoremap [eh :call cj#ljumper("h")<CR>
nnoremap [el :call cj#ljumper("t")<CR>
nnoremap [fh :call cj#rjumper("h")<CR>
nnoremap [fl :call cj#rjumper("t")<CR>

vnoremap [f :echo " Try [ff, if you're trying to search."<cr>
vnoremap [e :echo " Try [ff, if you're trying to search."<cr>
vnoremap [eh :call cj#vlwrapper("h")<CR>
vnoremap [el :call cj#vlwrapper("t")<CR>
vnoremap [fh :call cj#vrwrapper("h")<CR>
vnoremap [fl :call cj#vrwrapper("t")<CR>

"vnoremap [ef :call cj#vlwrapper()<CR>
"vnoremap [F :call cj#vlwrapper()<CR>
"vnoremap [f :call cj#vrwrapper()<CR>
