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

template |nano-random-angle|
#!/usr/bin/env tclsh

unset;
set fp [open "./coords.xyz" r];
set file_data_all [read $fp];
set file_data_array [split $file_data_all "\n"];
close $fp;

# generate 4 numbers for random rotation...
proc randRotation {} {
	return [ list [expr rand()] [expr rand()] [expr rand()] [expr rand()*360] ] 
}

set i 0;
set all [atomselect top all];
set residues [lsort -unique [$all get residue]];
set leng_res [llength $residues];
set leng_file [llength $file_data_array];
set cmp [expr $leng_res < $leng_file];
set leng [expr $cmp?$leng_res:$leng_file];
foreach each_residue $residues coord $file_data_array {
	if {$i > $leng - 1} {
		break;
	}
	set sel0 [atomselect top "residue $each_residue"];
	move_to $sel0 $coord;

	set var [randRotation]
	set center_pt [measure center $sel0]
	set ax_vec [lrange $var 0 2]
	set angle [lindex $var 3]
	$sel0 move [trans center $center_pt axis $ax_vec $angle deg]

	$sel0 delete
	set i [expr $i+1]

	if {$i > 1000 && $i%1000 == 0} {
		puts $i;
	}
}

endtemplate
