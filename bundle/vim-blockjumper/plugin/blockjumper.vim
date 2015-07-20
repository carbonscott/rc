nnoremap [gu :call blockjumper#up()<CR>
nnoremap [gd :call blockjumper#down()<CR>
"nnoremap [gv :call blockjumper#up()<CR>v:<c-u>call blockjumper#down()<CR>$
nnoremap [gv :call blockjumper#visual()<CR>
vnoremap [gv <c-[>j:call blockjumper#visual()<CR>

nnoremap [hu :call blockjumper_omitspace#up()<CR>
vnoremap [hu :call blockjumper_omitspace#up()<CR>
nnoremap [hd :call blockjumper_omitspace#down()<CR>
vnoremap [hd :call blockjumper_omitspace#down()<CR>
