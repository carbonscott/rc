" function! cj#ljumper("h") "{ 
" 	" * jump to the left keyword; 
" 	" * put cursor at the beginning of the search result;
" 	let s:pat = input('Keyword to search: ')
" 	"execute "normal V\?\\%Vexe\<CR>\<ESC>"
" 	"let @/=s:pat
" 	let s:lnumber = line(".")
" 	set ignorecase
" 	let [s:ln, s:col] = searchpos(s:pat, 'bn', s:lnumber)
" 	if s:ln == 0
" 		echo "Pattern Not Found: "
" 	else
" 		"execute "normal! \?\\%".s:lnumber."l\\c".s:pat."\<CR>\<ESC>"
" 		call cursor(s:ln,s:col)
" 	endif
" 	set noignorecase
" 	let @/="\\%".s:lnumber."l\\c".s:pat
" endfunction
" "}
" 
" function! cj#ljumper("t") "{
" 	" * jump to the left keyword; 
" 	" * put cursor at the end of the search result;
" 	let s:pat = input('Keyword to search: ')
" 	"execute "normal V\?\\%Vexe\<CR>\<ESC>"
" 	"let @/=s:pat
" 	let s:lnumber = line(".")
" 	set ignorecase
" 	" Comments:
" 	" * `b` stands for searching backwards
" 	" * `n` stands for not moving cursor
" 	" * `e` stands for put cursor at the end of the searched result
" 	let [s:ln, s:col] = searchpos(s:pat, 'bne', s:lnumber)
" 	if s:ln == 0
" 		echo "Pattern Not Found: "
" 	else
" 		"execute "normal! \?\\%".s:lnumber."l\\c".s:pat."\<CR>\<ESC>"
" 		call cursor(s:ln,s:col)
" 	endif
" 	set noignorecase
" 	let @/="\\%".s:lnumber."l\\c".s:pat
" endfunction
" "}

" function! cj#rjumper("h") "{
" 	let s:pat = input('Keyword to search: ')
" 	"execute "normal V\?\\%Vexe\<CR>\<ESC>"
" 	let s:lnumber = line(".")
" 	set ignorecase
" 	let [s:ln, s:col] = searchpos(s:pat, 'n', s:lnumber)
" 	if s:ln == 0
" 		echo "Pattern Not Found: "
" 	else
" 		"execute "normal! \/\\%".s:lnumber."l\\c".s:pat."\<CR>\<ESC>"
" 		call cursor(s:ln,s:col)
" 	endif
" 	set noignorecase
" 	let @/="\\%".s:lnumber."l\\c".s:pat
" endfunction
" "}
" 
" function! cj#rjumper("t") "{
" 	let s:pat = input('Keyword to search: ')
" 	"execute "normal V\?\\%Vexe\<CR>\<ESC>"
" 	let s:lnumber = line(".")
" 	set ignorecase
" 	let [s:ln, s:col] = searchpos(s:pat, 'ne', s:lnumber)
" 	if s:ln == 0
" 		echo "Pattern Not Found: "
" 	else
" 		"execute "normal! \/\\%".s:lnumber."l\\c".s:pat."\<CR>\<ESC>"
" 		call cursor(s:ln,s:col)
" 	endif
" 	set noignorecase
" 	let @/="\\%".s:lnumber."l\\c".s:pat
" endfunction
" "}

function! cj#ljumper(headtail) "{
	" * jump to the left keyword; 
	" * put cursor at the end of the search result;
	let s:pat = input('Keyword to search: ')
	"execute "normal V\?\\%Vexe\<CR>\<ESC>"
	"let @/=s:pat
	let s:lnumber = line(".")
	set ignorecase
	if a:headtail ==# "h"
	" Comments:
	" * `b` stands for searching backwards
	" * `n` stands for not moving cursor
	" * `e` stands for put cursor at the end of the searched result
		let [s:ln, s:col] = searchpos(s:pat, 'bn', s:lnumber)
	elseif a:headtail ==# "t"
		let [s:ln, s:col] = searchpos(s:pat, 'bne', s:lnumber)
	else 
		let s:ln = 0
	endif
	if s:ln == 0
		echo "Pattern Not Found: "
	else
		"execute "normal! \?\\%".s:lnumber."l\\c".s:pat."\<CR>\<ESC>"
		call cursor(s:ln,s:col)
	endif
	set noignorecase
	let @/="\\%".s:lnumber."l\\c".s:pat
endfunction

function! cj#rjumper(headtail) "{
	" * jump to the left keyword; 
	" * put cursor at the end of the search result;
	let s:pat = input('Keyword to search: ')
	"execute "normal V\?\\%Vexe\<CR>\<ESC>"
	"let @/=s:pat
	let s:lnumber = line(".")
	set ignorecase
	if a:headtail ==# "h"
	" Comments:
	" * `b` stands for searching backwards
	" * `n` stands for not moving cursor
	" * `e` stands for put cursor at the end of the searched result
		let [s:ln, s:col] = searchpos(s:pat, 'n', s:lnumber)
	elseif a:headtail ==# "t"
		let [s:ln, s:col] = searchpos(s:pat, 'ne', s:lnumber)
	else 
		let s:ln = 0
	endif
	if s:ln == 0
		echo "Pattern Not Found: "
	else
		"execute "normal! \?\\%".s:lnumber."l\\c".s:pat."\<CR>\<ESC>"
		call cursor(s:ln,s:col)
	endif
	set noignorecase
	let @/="\\%".s:lnumber."l\\c".s:pat
endfunction


function! cj#vlwrapper(headtail)
	normal! gv
	call cj#ljumper(a:headtail)
endfunction

function! cj#vrwrapper(headtail)
	normal! gv
	call cj#rjumper(a:headtail)
endfunction

function! cj#vlwrapper(headtail)
	normal! gv
	call cj#ljumper(a:headtail)
endfunction

function! cj#vrwrapper(headtail)
	normal! gv
	call cj#rjumper(a:headtail)
endfunction


" after which we can use arrow key and / or ? to redo the pattern
" searching and use n/N.

" function! cj#ljumper()
" 	let s:pat = input('Keyword to search: ')
" 	"execute "normal V\?\\%Vexe\<CR>\<ESC>"
" 	"let @/=s:pat
" 	let s:lnumber = line(".")
" 	set ignorecase
" 	let [s:ln, s:col] = searchpos(s:pat, 'bn', s:lnumber)
" 	if s:ln == 0
" 		echo "Pattern Not Found: "
" 	else
" 		"execute "normal! \?\\%".s:lnumber."l\\c".s:pat."\<CR>\<ESC>"
" 		call cursor(s:ln,s:col)
" 	endif
" 	set noignorecase
" 	let @/="\\%".s:lnumber."l\\c".s:pat
" endfunction
