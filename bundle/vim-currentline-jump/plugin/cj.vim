nnoremap [f :echo " Try [fl or [fh, if you're trying to search."<cr>
nnoremap [fh :setlocal hls<CR>:call cj#ljumper("h")<CR>
nnoremap [fl :setlocal hls<CR>:call cj#rjumper("h")<CR>

vnoremap [f :echo " Try [fl or [fh, if you're trying to search."<cr>
vnoremap [fh :<c-u>setlocal hls<CR>v:call cj#vlwrapper("h")<CR>
vnoremap [fl :<c-u>setlocal hls<CR>v:call cj#vrwrapper("h")<CR>
