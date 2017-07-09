" ~~~~1.Define Colorscheme~~~~
highlight bg_green ctermfg=Blue ctermbg=LightGreen
highlight bg_yellow ctermfg=Black ctermbg=Yellow
highlight bg_magenta ctermfg=White ctermbg=Magenta

" ~~~~2.Define highlight syntax~~~~
syntax region bg_green start="G:{" end="}" 
syntax region bg_yellow start="Y:{" end="}" 
syntax region bg_magenta start="M:{" end="}" 

" ~~~~3.Define highlight shortcuts~~~~
vnoremap [hg :<c-u>call g:quote#fun2('G:{','}')<CR>
vnoremap [hy :<c-u>call g:quote#fun2('Y:{','}')<CR>
vnoremap [hm :<c-u>call g:quote#fun2('M:{','}')<CR>
