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

template |np-array|
np.array([
				____,
				____,
])
endtemplate

template |import-matplotlib|
import matplotlib.pyplot as plt
endtemplate

template |plt-plot|
plt.plot(____)
endtemplate

template |plt-show|
plt.show()
endtemplate

template |numpy-io-genfromtxt|
np.genfromtxt('____')
endtemplate

template |if|
if ____:
				____
endtemplate

template |plt-label|
plt.____label("____")
endtemplate 

template |plt-savefig|
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
re.compile('''
____
''',
re.VERBOSE)
endtemplate

template |re-match|
____.match("____")
endtemplate

template |plt-imshow|
plt.imshow(____)
endtemplate

template |plt-savefig|
plt.savefig('____')
endtemplate

template |skimage-imread|
skimage.imread(____)
endtemplate

template |cv2-imread|
cv2.imread('____')
endtemplate

template |cv2-imshow|
cv2.imshow('____',____)
endtemplate

template |cv2-waitkey|
cv2.waitKey(0)
endtemplate

template |cv2-destropyAllWindows|
cv2.destroyAllWindows()
endtemplate

template |cv2-imwrite|
cv2.imwrite('____', ____)
endtemplate

template |cv2-cvtColor-Gray|
cv2.cvtColor(____,cv2.COLOR_BGR2GRAY)
endtemplate

template |cv2-cvtColor-HSC|
cv2.cvtColor(____,cv2.COLOR_BGR2HSV)
endtemplate

template |cv2-cvtColor|
cv2.cvtColor(____,____)
endtemplate

template |section|
# ___/ ____ \___
endtemplate

template |cv2-split|
cv2.split(____)
endtemplate

template |cv2-merge|
cv2.merge(____) 
endtemplate

template |np-zeros|
np.zeros(____,dtype="uint____")
endtemplate

template |cv2-calcHist|
cv2.calcHist($:image____,$:channels____,$:mask____,$histSize:____,$:ranges____)
endtemplate

template |plt-hist|
plt.hist($flattened_iamge:____,$hist_size:____,$range:____)
endtemplate

template |cv2-line|
cv2.line($:image____, $:start____, $:end____, $:color____, $:thickness____)
endtemplate

template |cv2-wait_and_destroy|
cv2.waitKey(0)
cv2.destroyAllWindows()
endtemplate

template |cv2-rectangle|
cv2.rectangle($:image____,$:start____,$:opposite____,$:color____,$:thickness____)
endtemplate

template |cv2-circle|
cv2.circle($image:____, $center:____, $radius:____, $color:____, $fill:____) 
endtemplate

template |cv2-polylines|
cv2.polylines($image:____,[$points:____],$is_closed:____,$color:____,$thickness:____)
endtemplate

template |cv2-putText|
cv2.putText(
				$image:____,
				$text:____,
				$bottom_left_start:____,
				$Font:____,
				$FontSize:____,
				$color:____,
				$thickness:____,
)
endtemplate
