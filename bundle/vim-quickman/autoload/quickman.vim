function! quickman#man(man_command)
	" read command...
	let s:read = "0read !man ".a:man_command

	" remove <c-v><c-h>: character...
	let s:remove = "%s".
							 \ "/\\S".
							 \ "/".
							 \ "/g"

	" execute command...
	execute s:read

	" refresh screen...
	redraw

	" search test...
	let s:search = search("",)

	" substitute it only when command is correct...
	if s:search !=# 0 
		execute s:remove
	endif
endfunction


function! quickman#man(man_command)
	" read command...
	let s:read = "0read !man ".a:man_command

	" remove <c-v><c-h>: character...
	let s:remove = "%s".
							 \ "/\\S".
							 \ "/".
							 \ "/g"

	" execute command...
	execute s:read

	" refresh screen...
	redraw

	" search test...
	let s:search = search("",)

	" substitute it only when command is correct...
	if s:search !=# 0 
		execute s:remove
	endif
