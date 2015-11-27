nnoremap [f :echo " Try [ff, if you're trying to search."<cr>
nnoremap [eff :call cj#ljumper("h")<CR>
nnoremap [efe :call cj#ljumper("t")<CR>
nnoremap [ff :call cj#rjumper("h")<CR>
nnoremap [fe :call cj#rjumper("t")<CR>

nnoremap [f :echo " Try [ff, if you're trying to search."<cr>
vnoremap [eff :call cj#vlwrapper("h")<CR>
vnoremap [efe :call cj#vlwrapper("t")<CR>
vnoremap [ff :call cj#vrwrapper("h")<CR>
vnoremap [fe :call cj#vrwrapper("t")<CR>

"vnoremap [ef :call cj#vlwrapper()<CR>
"vnoremap [F :call cj#vlwrapper()<CR>
"vnoremap [f :call cj#vrwrapper()<CR>
