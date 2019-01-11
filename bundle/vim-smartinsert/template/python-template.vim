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
import matplotlib; matplotlib.use('PS')
import matplotlib.pyplot as plt
endtemplate

template |plt.subplots|
plt.subplots($3:____,$2:____,figsize=($w:____,$h:____))
endtemplate

template |plt.font|
plt.rc('font', **{'serif':'Helvetica'})    # ...Set font
plt.rc('font', size=10)                    # ...Set font size
endtemplate

template |imshow|
imsow(____,interpolation='none',cmap='gray')
endtemplate

template |plt.savefig|
plt.savefig(____)
endtemplate

template |if|
if ____:
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

template |skimage-imread|
skimage.imread(____)
endtemplate

template |np-zeros|
np.zeros(____,dtype="uint____")
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
description = 
"""$description:____"""
,formatter_class=argparse.RawTextHelpFormatter)
endtemplate

template |argparse.add_arg|
parser.add_argument("-____", "--____",
    required = $True:____,
    metavar  = ("____"),
    type     = $int:____,
    nargs    = ____,
    help     = """$help:____""",)
endtemplate

template |argparse.arg_parse|
args = parser.parse_args()
endtemplate

template |argparse.positional|
parser.add_argument(
    '$var:____', 
    metavar='____', 
    type=____, 
    nargs='____', 
    help='____')
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
gp("set encoding utf8")
gp("set output '%s'" % eps)
gp("set terminal postscript eps enhanced color solid '%s' %d size %g,%g" % 
  (font, fontsize, width, height))
gp("set xlabel '%s'" % xlabel)
gp("set ylabel '%s'" % ylabel)
endtemplate

template |banner|
# Python script for ____
# Author: Cong Wang
# License: This file is placed in the public domain.

# ############################################################################
# ##                                                                        ##
# ##   ____   ##
# ##          ##
# ##          ##
# ##   To use:##
# ##     ____ ##
# ##          ##
# ############################################################################
endtemplate

template |section|
#=====[ ____ ]==========================================
endtemplate


template |vi-{{{|
# {{{ ___/ ____ \___
endtemplate

template |vi-fdm|
# vi:sts=1:fdm=marker:
endtemplate

