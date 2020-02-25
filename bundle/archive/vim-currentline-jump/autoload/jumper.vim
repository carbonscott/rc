function jumper#left()
	let s:lnum = line(".")	
	execute "normal! \?\\%".s:lnum."l\\c"
endfunction



