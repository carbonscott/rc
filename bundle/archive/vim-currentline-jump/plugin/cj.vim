nnoremap <s-f> :setlocal hls<CR>:call cj#ljumper("h")<CR>
nnoremap f :setlocal hls<CR>:call cj#rjumper("h")<CR>

vnoremap <s-f> :<c-u>setlocal hls<CR>v:call cj#vlwrapper("h")<CR>
vnoremap f :<c-u>setlocal hls<CR>v:call cj#vrwrapper("h")<CR>
