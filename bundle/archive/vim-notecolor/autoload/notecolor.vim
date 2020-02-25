" ~~~~1.Define Colorscheme~~~~
highlight fg_red ctermfg=Red ctermbg=NONE
highlight fg_blue ctermfg=LightBlue ctermbg=NONE
highlight bg_yellow ctermfg=Black ctermbg=Yellow
highlight fg_magenta ctermfg=Magenta ctermbg=NONE
highlight fg_ignore ctermfg=Black ctermbg=Black
highlight fg_white ctermfg=White ctermbg=NONE
highlight fg_gray ctermfg=Blue ctermbg=NONE cterm=Italic

" ~~~~2.Define highlight syntax~~~~
syntax region fg_red start="R:{" end="}" 
syntax region fg_blue start="B:{" end="}" 
syntax region bg_yellow start="Y:{" end="}" 
syntax region fg_magenta start="M:{" end="}" 
syntax region fg_ignore start="I:{" end="}" 
syntax region fg_white start="W:{" end="}" 
syntax match fg_gray /\[x\].*/

" ~~~~3.Define highlight shortcuts~~~~
vnoremap [hr :<c-u>call g:quote#fun3('R:{','}')<CR>
vnoremap [hb :<c-u>call g:quote#fun3('B:{','}')<CR>
vnoremap [hy :<c-u>call g:quote#fun3('Y:{','}')<CR>
vnoremap [hm :<c-u>call g:quote#fun3('M:{','}')<CR>
vnoremap [hi :<c-u>call g:quote#fun3('I:{','}')<CR>
vnoremap [hw :<c-u>call g:quote#fun3('W:{','}')<CR>

