"#t: nnoremap [f :echo " Try [ff, if you're trying to search."<cr>
"#t: nnoremap [e :echo " Try [ff, if you're trying to search."<cr>
"#t: nnoremap [eh :call cj#ljumper("h")<CR>
"#t: nnoremap [el :call cj#ljumper("t")<CR>
"#t: nnoremap [fh :call cj#rjumper("h")<CR>
"#t: nnoremap [fl :call cj#rjumper("t")<CR>
"#t: 
"#t: vnoremap [f :echo " Try [ff, if you're trying to search."<cr>
"#t: vnoremap [e :echo " Try [ff, if you're trying to search."<cr>
"#t: vnoremap [eh :call cj#vlwrapper("h")<CR>
"#t: vnoremap [el :call cj#vlwrapper("t")<CR>
"#t: vnoremap [fh :call cj#vrwrapper("h")<CR>
"#t: vnoremap [fl :call cj#vrwrapper("t")<CR>

nnoremap [f :echo " Try [ff, if you're trying to search."<cr>
nnoremap [fh :setlocal hls<CR>:call cj#ljumper("h")<CR>
nnoremap [fl :setlocal hls<CR>:call cj#rjumper("h")<CR>

