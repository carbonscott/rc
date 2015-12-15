nnoremap [f :echo " Try [ff, if you're trying to search."<cr>
nnoremap [e :echo " Try [ff, if you're trying to search."<cr>
nnoremap [ef :call cj#ljumper("h")<CR>
nnoremap [ee :call cj#ljumper("t")<CR>
nnoremap [ff :call cj#rjumper("h")<CR>
nnoremap [fe :call cj#rjumper("t")<CR>

vnoremap [f :echo " Try [ff, if you're trying to search."<cr>
vnoremap [e :echo " Try [ff, if you're trying to search."<cr>
vnoremap [ef :call cj#vlwrapper("h")<CR>
vnoremap [ee :call cj#vlwrapper("t")<CR>
vnoremap [ff :call cj#vrwrapper("h")<CR>
vnoremap [fe :call cj#vrwrapper("t")<CR>

"vnoremap [ef :call cj#vlwrapper()<CR>
"vnoremap [F :call cj#vlwrapper()<CR>
"vnoremap [f :call cj#vrwrapper()<CR>
