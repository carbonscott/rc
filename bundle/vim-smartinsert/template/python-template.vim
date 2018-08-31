template |head|
#!/usr/bin/env python
# -*- coding: utf-8 -*-

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

template |section|
# ___/ ____ \___
endtemplate

template |np-zeros|
np.zeros(____,dtype="uint____")
endtemplate

template |plt-hist|
plt.hist($flattened_iamge:____,$hist_size:____,$range:____)
endtemplate

template |np-ones|
np.ones(____,np.uint____)
endtemplate

template |import os.path|
import os.path
endtemplate

template |np.dtype|
np.dtype([($key:____,$unit_type:____,$shape:____)])
endtemplate

template |np.dtype.item|
($key:____,$unit_type:____,$shape:____)
endtemplate

template |io-with|
with open('$file:____','$read_or_write:____') as $file_handle:____:
    ____
endtemplate

template |argparse.import|
import argparse
endtemplate

template |argparse.creat_parser|
parser = argparse.ArgumentParser(
    description = """$description:____""")
endtemplate

template |argparse.add_arg|
parser.add_argument("-____", "--____",
    required=$True:____,
    metavar = ("____"),
    type = $int:____,
    nargs = ____,
    help = """$help:____""",
    )
endtemplate

template |argparse.arg_parse|
args = parser.parse_args()
endtemplate

template |error-index|
IndexError: ____
endtemplate

template |gp|
eps       = ____
font      = ____
fontsize  = ____
xlabel    = ____
ylabel    = ____
golden = 1.6
width = 5
height = width / golden
gp = Gnuplot.Gnuplot(persist = False)
gp("set output '%s'" % eps)
gp("set terminal postscript eps enhanced color solid '%s' %d size %g,%g" % 
  (font, fontsize, width, height))
gp("set xlabel '%s'" % xlabel)
gp("set ylabel '%s'" % ylabel)
endtemplate
