template |head|
#!/usr/bin/env julia
endtemplate

template |function|
function ____(____)
				____
end
endtemplate

template |function-inline|
____(____) = ____
endtemplate

template |function-anonymous|
____ -> ____
endtemplate

template |map|
map(____,____)
endtemplate

template |compound-expresssion|
begin
				____
end
endtemplate

template |if|
if ____
				____
elseif
				____
else
				____
end
endtemplate

template |ternary|
____ ? ____ : ____
endtemplate

template |while|
while ____
				____
end
endtemplate

template |for-=|
for ____ = ____:____
				____
end
endtemplate

template |for-in|
for ____ in ____
				____
end
endtemplate

template |subset|
<: ____
endtemplate

template |instance-of|
::____
endtemplate

template |type-union|
Union{____,____}
endtemplate

template |type-{}|
{____}
endtemplate

template |struct|
struct ____
				____
end
endtemplate

template |type-tuple|
Tuple{____,____}
endtemplate

template |str-search|
search(____,____)
endtemplate

template |str-replace|
replace(____,____,____)
endtemplate

template |io-write-file|
open("____","w") do $1:____
				for ____ in ____
								____
								write($1:____,____)
				end
end
endtemplate

template |join|
join(____,____)
endtemplate

template |io-println|
println(____)
endtemplate
