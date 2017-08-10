template |function|
function ____(____)
____ :: ____ ! type of return value...
____, intent(in) :: ____
____
return
end function ____
endtemplate

template |const-real|
real(dp),parameter :: ____=_____dp
endtemplate 

template |const-integer|
integer, parameter :: ____ = ____
endtemplate 

template |const-string|
character(len=____),parameter :: ____
endtemplate 

template |real|
real(dp) :: ____
endtemplate 

template |integer|
integer :: ____
endtemplate 

template |string|
character(len=____) :: ____
endtemplate 

template |string-allocatable|
character(:),allocatable :: ____ 
endtemplate 

template |if|
if (____) then
				____
end if
endtemplate

template |sub|
subroutine ____(____) !{
____
end subroutine !}
endtemplate

template |set-module|
module ____
use ____
implicit none

! local to module...
private ____
! for output... 
public  ____

contains

____
end module
endtemplate

template |for|
do ____ = ____, ____ !{
				____
end do !}
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

template |program|
program $1:____
implicit none
____
end program $1:____
endtemplate 

template |matmul|
matmul(____,____)
endtemplate 

template |module|
module $1:____
implicit none
____
end module $1:____
endtemplate 

template |string-concat|
write(____,'(I____)') ____ ! str, type, integer...
endtemplate 

template |intent|
____,intent(____) :: ____  ! type, in/out/inout, var...   
endtemplate 

template |string-id|
____($1:____:$1:____)
endtemplate 
