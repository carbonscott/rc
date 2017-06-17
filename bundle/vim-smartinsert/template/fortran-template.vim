template |function|
function ____(____)
____ :: ____ ! type of return value...
____, intent(in) :: ____
____
return
end function ____
endtemplate

template |if|
if (____) then
				____
end if
endtemplate

template |sub|
subroutine ____(____)
____
end subroutine
endtemplate

template |module|
module ____
use ____
implicit none

! local to module...
private ____
! for output... 
public  ____

____
end module
endtemplate

template |for|
do ____ = ____, ____
				____
end do
endtemplate

template |const|
____, parameter :: ____
endtemplate

template |print|
print *, ____
endtemplate

template |read|
open(unit=____, file="____", status="old")
read(____, *) ____
close(____) 
endtemplate

template |write|
open(unit=____, file="____", status="replace")
write(____, *) ____
close(____) 
endtemplate

template |append|
open(unit=____, file="____", position="append", status="old")
write(____, *) ____
close(____) 
endtemplate

template |time|
call system_clock (count_rate=____)
call system_clock (count=____)

call system_clock (count=____)
print*,'It took',real(____ - ____) / real(____),'sec'
endtemplate

