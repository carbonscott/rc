

# template gfor
# 
# endtemplate

template |perl_for| 
foreach my ____ (____) {
				____
				____
}
endtemplate

template |cif|
if ____ {
				____
}
endtemplate

template |latex_table| 
____ & ____ & ____ \\
____ & ____ & ____ \\
____ & ____ & ____ 
endtemplate



template |latex_table| 
____ & ____ & ____ \\
____ & ____ & ____ \\
____ & ____ & ____ 
endtemplate


template |fk|
GUPTA is AWESOME!
endtemplate

" use the tcl template
template |tcl-for|
for {____} {____} {____} {
				____
}
endtemplate

template |tcl-proc|
proc ____ {____} {
				____
}
endtemplate

template |tcl-while|
while {____} {
				____
}
endtemplate

template |tcl-if|
if {____} {
				____
}
endtemplate

template |tcl-if-else|
if {____} {
				____
} else {
				____
}
endtemplate



metatemplate |template|
template |____|
____
endtemplate
endmetatemplate
