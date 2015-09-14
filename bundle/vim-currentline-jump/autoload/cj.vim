function! cj#ljumper()
	let s:pat = input('Keyword to search: ')
	"execute "normal V\?\\%Vexe\<CR>\<ESC>"
	"let @/=s:pat
	set ignorecase
	if search(s:pat, 'bn', line(".")) == 0
		echo "Pattern Not Found!"
	else
		execute "normal! V\?\\%V\\c".s:pat."\<CR>\<ESC>"
	endif
	set noignorecase
endfunction

function! cj#rjumper()
	let s:pat = input('Keyword to search: ')
	"execute "normal V\?\\%Vexe\<CR>\<ESC>"
	let @/=""
	set ignorecase
	if search(s:pat, 'n', line(".")) == 0
		echo "Pattern Not Found!"
	else
		execute "normal! V\/\\%V\\c".s:pat."\<CR>\<ESC>"
		"execute "normal V\/\\%V\\c".s:pat."\<CR>\<ESC>"
		"execute "normal \/\\%V\\c".s:pat."\<CR>"
	endif
	set noignorecase
endfunction

" after which we can use arrow key and / or ? to redo the pattern
" searching and use n/N.
