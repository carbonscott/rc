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


function! quickman#perldoc(perldoc_cmd)
	" read command...
	let read = "0read !man ".a:perldoc_cmd

	" remove <c-v><c-h>: character...
	let remove = [ 
	\ "%s".
  \ "/\\v\\d\\[m".
  \ "/".
  \ "/g",
  \
	\ "%s".
  \ "/".
  \ "/".
  \ "/g",
	\]

	" execute command...
	execute read

	" refresh screen...
	redraw

	" search test...
	let search = [search("",),search("\\v\\d\\[m",)]

	" substitute it only when command is correct...
	if search[0] !=# 0 && search[1] !=# 0
		execute remove[0]
		redraw
		execute remove[1]
		redraw
	endif
endfunction
