function! cj#ljumper(headtail) "{
	" * jump to the left keyword; 
	" * put cursor at the end of the search result;
	let s:pat = input('search <---: ', "")
	if s:pat ==# ""
				execute "normal! g^"
	else
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
				 redraw
					echo "Pattern Not Found: "
				else
					call cursor(s:ln,s:col)
					let @/="\\%".s:lnumber."l\\c".s:pat
				 set noignorecase
				endif

 endif

endfunction

function! cj#rjumper(headtail) "{
	" * jump to the left keyword; 
	" * put cursor at the end of the search result;
	let s:pat = input('search --->: ', "")
	if s:pat ==# ""
				execute "normal! g$"
	else 
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
				 redraw
	   	echo "Pattern Not Found: "
	   else
	   	call cursor(s:ln,s:col)
	    let @/="\\%".s:lnumber."l\\c".s:pat
	   endif
	   set noignorecase
	endif

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

