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
