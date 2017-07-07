template |head|
#!/usr/bin/env python

____
endtemplate

template |np|
import numpy as np
endtemplate

template |class|
class ____:

				def __init__(self,____):
								____
endtemplate

template |function|
def ____(____):
				"""____
				____
				"""
				____
endtemplate


template |math|
import math
endtemplate

template |for|
for ____ in ____:
				____
endtemplate

template |dict|
____ = {
				'____' : ____,
				'____' : ____,
}
endtemplate

template |list|
____ = [
				____,
				____,
]
endtemplate

template |listcp|
[____ for ____ in ____]
endtemplate

template |open|
open(____,____)
endtemplate


template |write-help|
$1:____ = open(____,____)
$1:____.write(____)
$1:____.close()
endtemplate

template |read-help|
$1:____ = open(____,____)
$1:____.read()     # read entire file into one string                        
$1:____.split()    # it's always useful to split one string into array       
$1:____.close()
endtemplate

template |npa|
np.array([
				____,
				____,
])
endtemplate

