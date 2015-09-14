function! cj#ljumper()
	let s:pat = input('Keyword to search: ')
	"execute "normal V\?\\%Vexe\<CR>\<ESC>"
	execute "normal V\?\\%V\\c".s:pat."\<CR>\<ESC>"
endfunction

function! cj#rjumper()
	let s:pat = input('Keyword to search: ')
	"execute "normal V\?\\%Vexe\<CR>\<ESC>"
	execute "normal V\/\\%V\\c".s:pat."\<CR>\<ESC>"
endfunction

