function! cj#ljumper()
	let s:pat = input('Keyword to search: ')
	"execute "normal V\?\\%Vexe\<CR>\<ESC>"
	"let @/=s:pat
	if search(s:pat, 'bn', line(".")) == 0
		echo "Pattern Not Found!"
	else
		execute "normal! V\?\\%V\\c".s:pat."\<CR>\<ESC>"
	endif
endfunction

function! cj#rjumper()
	let s:pat = input('Keyword to search: ')
	"execute "normal V\?\\%Vexe\<CR>\<ESC>"
	"let @/=s:pat
	if search(s:pat, 'n', line(".")) == 0
		echo "Pattern Not Found!"
	else
		execute "normal! V\/\\%V\\c".s:pat."\<CR>\<ESC>"
	endif
endfunction

