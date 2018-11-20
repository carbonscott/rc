vnoremap [gg :<c-u>call wordsubstitute#run1()<CR>
" vnoremap [gc :<c-u>call wordsubstitute#run2()<CR>
vnoremap [g/ :<c-u>call wordsubstitute#run3()<CR>nN
vnoremap [g? :<c-u>call wordsubstitute#run32()<CR>nN
snoremap [gc <c-g>:<c-u>call wordsubstitute#run4()<CR>
vnoremap [gc :<c-u>call wordsubstitute#run4()<CR>
snoremap [c <c-g>:<c-u>call wordsubstitute#run4()<CR>
vnoremap [c :<c-u>call wordsubstitute#run4()<CR>
