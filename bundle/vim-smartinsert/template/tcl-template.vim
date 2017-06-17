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
set ____ [atomselect top ____]
endtemplate

template |out|
# <atomselection> cmd <output file>
____ write____ ____
endtemplate

template |mload|
mol load psf ____ pdb ____
endtemplate

