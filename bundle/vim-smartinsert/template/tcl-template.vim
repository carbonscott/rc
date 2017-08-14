template |expr|
[expr {____}]
endtemplate

template |help.cmd|
# the cmd sees the an evaluated argument... 
endtemplate

template |cmd|
[____ ____]
endtemplate

template |for|
for {____} {____} {____} {
				____
}
endtemplate

template |proc|
proc ____ {____} {
				____
}
endtemplate

template |while|
while {____} {
				____
}
endtemplate

template |if|
if {____} {
				____
}
endtemplate

template |if-else|
if {____} {
				____
} else {
				____
}
endtemplate

#-> personal library...
template |dup|
# command <psf_file> <pdb_file> <num_duplicate>
Duplicate_PSFPDB ____ ____ ____
endtemplate

template |com|
# command "<the single name for psf and pdb>"
Combine_PSFPDB "____"
endtemplate

template |sel|
# atomselection filtering-keyword...
set ____ [atomselect top ____]
endtemplate

template |out|
# <atomselection> cmd <output file>
____ write____ ____
endtemplate

template |mload|
mol load psf ____ pdb ____
endtemplate

template |list|
[list ____]
endtemplate

template |group|
{____}
endtemplate

template |sort|
[ lsort -unique ____ ]
endtemplate

template |list-length|
[ llength ____ ]
endtemplate

template |foreach|
foreach ____ ____ {
				____
}
endtemplate

template |move_to|
# atomselection position...
move_to ____ ____
endtemplate

template |measure-center|
[ measure center ____ ]
endtemplate

template |list-range|
# list index index...
[ lrange ____ ____ ____ ]
endtemplate

template |list-index|
# list index...
[ lindex ____ ____ ]
endtemplate

template |rotate|
# atomselection center axis angle to rotate...
____ move [trans center ____ axis ____ ____ deg]
endtemplate

template |i++|
set ____ [expr ____+1]
endtemplate

template |translate|
# atomselection coordinates
____ moveby ____
endtemplate

template |set_view_orthographic|
display projection orthographic
endtemplate

template |set_view_perspective|
display projection perspective
endtemplate

template |view_angle|
rotate ____ by ____
endtemplate

template |help-tcl|
# [____] envokes tcl interpreter again
# [expr ____] is the general tcl expression
endtemplate

template |arg-expand|
{*}{____}
endtemplate

template |head|
#!/usr/bin/env tclsh
endtemplate

template |eval|
[eval ____]
endtemplate

template |concat|
[concat ____]
endtemplate
