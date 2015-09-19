function! cj#ljumper()
	let s:pat = input('Keyword to search: ')
	"execute "normal V\?\\%Vexe\<CR>\<ESC>"
	"let @/=s:pat
	let s:lnumber = line(".")
	set ignorecase
	if search(s:pat, 'bn', s:lnumber) == 0
		echo "Pattern Not Found!"
	else
		execute "normal! \?\\%".s:lnumber."l\\c".s:pat."\<CR>\<ESC>"
	endif
	set noignorecase
	let @/="\\%".s:lnumber."l\\c".s:pat
endfunction

function! cj#rjumper()
	let s:pat = input('Keyword to search: ')
	"execute "normal V\?\\%Vexe\<CR>\<ESC>"
	let s:lnumber = line(".")
	set ignorecase
	if search(s:pat, 'n', s:lnumber) == 0
		echo "Pattern Not Found!"
	else
		execute "normal! \/\\%".s:lnumber."l\\c".s:pat."\<CR>\<ESC>"
		"execute "normal! V\/\\%V\\c".s:pat."\<CR>\<ESC>"
	endif
	set noignorecase
	let @/="\\%".s:lnumber."l\\c".s:pat
endfunction

" after which we can use arrow key and / or ? to redo the pattern
" searching and use n/N.


