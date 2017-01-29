let s = 'aa\aa?aa/aa()\aa@aa/.~'
let t = substitute(s,
								\ '\([~./()\?\/\\]\)',
								\	'\="\\".submatch(0)',
								\ 'g'
								\)
echo t

"sfssssdfsaf
"sfssssdfsaf
"sfssssdfsaf
