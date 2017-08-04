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
( ____ )
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
"$____[@]"
endtemplate

template |deref$array|
${____[____]}
endtemplate

