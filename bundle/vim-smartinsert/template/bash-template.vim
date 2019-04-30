template |head|
#!/bin/bash
endtemplate

template |function|
function ____ {
    ____
}
endtemplate

template |if|
if [ ____ ]
then
    ____
fi
endtemplate

template |for|
for ____ in ____
do
    ____
done
endtemplate

template |array|
( {____} )
endtemplate

template |argument-list|
$@
endtemplate

template |case|
case ____ in
    ____) ____;;
    ____) ____;;
esac
endtemplate

template |while|
while ____
do
    ____
done
endtemplate

template |oneline_function|
function ____ { ____ ; }
endtemplate

template |deref@array|
"${____[@]}"
endtemplate

template |deref$array|
${____[____]}
endtemplate

template |array-range-init|
( {____..____} )
endtemplate 

template |help-floating_number_arithmetic|
distances=( {20..140..1} )
for i in "${distances[@]}"
do
    g=$(bc --mathlib <<< "scale=3; $i / 2.0")
    perl -pE "s/44.667/$g/g" cube_body.pdb > init_$i.pdb
done
endtemplate

template |perl_subs|
perl -p -E "s/____/____/g" ____ > ____
endtemplate

template |read-file|
# Load text file lines into a bash array.
OLD_IFS=$IFS
IFS=$'\n'
____=( $(cat "____") )
IFS=$OLD_IFS
endtemplate

template |file-linenumbers|
____=$( wc -l ____ | cut -f1 -d ' ' )
endtemplate

template |string-cmp|
__var__ == *"__str__"*
endtemplate


template |list.range|
seq -w __01__ __10__
endtemplate


template |util.timer|
# New line to mark the starting time...
while true; do echo -ne "`date +%H:%M:%S`\r"; done
endtemplate


template |sed.simple.example|
# Convert a comma connected string into a new line connected string by sed, then uniq them with sort...
echo '1B77, 1B8H, 1CLQ, 1IG9, 1IH7, 1Q9X, 1Q9Y, 1WAF, 1WAJ, 2A1K, 2ATQ, 2DTU, 2DY4, 2OYQ, 2OZM, 2OZS, 2P5G, 2P5O, 3CQ8, 3KD1, 3KD5, 3L8B, 3LDS, 3LZI, 3LZJ, 3NAE, 3NCI, 3NDK, 3NE6, 3NGI, 3NHG, 3QEI, 3QEP, 3QER, 3QES, 3QET, 3QEV, 3QEW, 3QEX, 3QNN, 3QNO, 3RMA, 3RMB, 3RMC, 3RMD, 3RWU, 3S9H, 3SCX, 3SI6, 3SJJ, 3SNN, 3SPY, 3SPZ, 3SQ0, 3SQ1, 3SQ2, 3SQ4, 3SUN, 3SUO, 3SUP, 3SUQ, 3TAB, 3TAE, 3TAF, 3TAG, 3UIQ, 4DTJ, 4DTM, 4DTN, 4DTO, 4DTP, 4DTR, 4DTS, 4DTU, 4DTX, 4DU1, 4DU3, 4DU4, 4E3S, 4FJ5, 4FJ7, 4FJ8, 4FJ9, 4FJG, 4FJH, 4FJI, 4FJJ, 4FJK, 4FJL, 4FJM, 4FJN, 4FJX, 4FK0, 4FK2, 4FK4, 4I9L, 4I9Q, 4J2A, 4J2B, 4J2D, 4J2E, 4KHN, 4KHQ, 4KHS, 4KHU, 4KHW, 4KHY, 4KI4, 4KI6, 4M3R, 4M3T, 4M3U, 4M3W, 4M3X, 4M3Y, 4M3Z, 4M41, 4M42, 4M45, 5GNQ' | sed -e $'s/, /\\\n/g' | sort | uniq > new_uniq.dat
endtemplate
