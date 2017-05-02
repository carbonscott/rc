nnoremap <s-h> :setlocal hls<CR>:call cj#ljumper("h")<CR>
nnoremap <s-l> :setlocal hls<CR>:call cj#rjumper("h")<CR>

vnoremap <s-h> :<c-u>setlocal hls<CR>v:call cj#vlwrapper("h")<CR>
vnoremap <s-l> :<c-u>setlocal hls<CR>v:call cj#vrwrapper("h")<CR>
