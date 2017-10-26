template |head|
#!/usr/bin/env python

____
endtemplate

template |import-numpy|
import numpy as np
endtemplate

template |class-define|
class ____:

				def __init__(self,____):
								____
endtemplate

template |function-define|
def ____(____):
				"""____
				____
				"""
				____
endtemplate


template |import-math|
import math
endtemplate

template |for|
for ____ in ____:
				____
endtemplate

template |data-dict|
____ = {
				'____' : ____,
				'____' : ____,
}
endtemplate

template |data-list|
____ = [
				____,
				____,
]
endtemplate

template |data-list-comprehension|
[____ for ____ in ____]
endtemplate

template |io-open|
open(____,____)
endtemplate


template |io-write-help|
$1:____ = open(____,____)
$1:____.write(____)
$1:____.close()
endtemplate

template |io-read-help|
$1:____ = open(____,"r")
$2:____ = $1:____.read()    # read entire file into one string                        
____ = $2:____.split("\n")  # it's always useful to split one string into array       
$1:____.close()
endtemplate

template |numpy-array|
np.array([
				____,
				____,
])
endtemplate

template |import-matplotlib|
import matplotlib.pyplot as plt
endtemplate

template |matplotlib-plot|
plt.plot(____)
endtemplate

template |matplotlib-show|
plt.show()
endtemplate

template |numpy-io-genfromtxt|
np.genfromtxt('____')
endtemplate

template |if|
if ____:
				____
endtemplate

template |matplotlib-plt_label|
plt.____label("____")
endtemplate 

template |matplotlib-plt_savefig|
export_rule = {
				"format" : "png",
				"dpi"    : 600,
}
plt.savefig("____", **export_rule)
endtemplate 

template |io-with|
with open(____) as $1:____:
				for ____ in $1:____:
								____
endtemplate

template |re-compile|
re.compile("____")
endtemplate

template |re-match|
____.match("____")
endtemplate
