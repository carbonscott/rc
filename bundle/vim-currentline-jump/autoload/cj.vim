function! cj#ljumper()
	let s:pat = input('Keyword to search: ')
	"execute "normal V\?\\%Vexe\<CR>\<ESC>"
	"let @/=s:pat
	let s:lnumber = line(".")
	set ignorecase
	let [s:ln, s:col] = searchpos(s:pat, 'bn', s:lnumber)
	if s:ln == 0
		echo "Pattern Not Found!"
	else
		"execute "normal! \?\\%".s:lnumber."l\\c".s:pat."\<CR>\<ESC>"
		call cursor(s:ln,s:col)
	endif
	set noignorecase
	let @/="\\%".s:lnumber."l\\c".s:pat
endfunction

function! cj#rjumper()
	let s:pat = input('Keyword to search: ')
	"execute "normal V\?\\%Vexe\<CR>\<ESC>"
	let s:lnumber = line(".")
	set ignorecase
	let [s:ln, s:col] = searchpos(s:pat, 'n', s:lnumber)
	if s:ln == 0
		echo "Pattern Not Found!"
	else
		"execute "normal! \/\\%".s:lnumber."l\\c".s:pat."\<CR>\<ESC>"
		call cursor(s:ln,s:col)
	endif
	set noignorecase
	let @/="\\%".s:lnumber."l\\c".s:pat
endfunction

function! cj#vlwrapper()
	normal! gv
	call cj#ljumper()
endfunction

function! cj#vrwrapper()
	normal! gv
	call cj#rjumper()
endfunction

" after which we can use arrow key and / or ? to redo the pattern
" searching and use n/N.


