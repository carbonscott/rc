template |head|
#!/usr/bin/env python
# -*- coding: utf-8 -*-

____
endtemplate


template |import-math|
import math
endtemplate


template |import-matplotlib|
import matplotlib; matplotlib.use('PS')
import matplotlib.pyplot as plt
endtemplate


template |plt.subplots|
plt.subplots($3:____,$2:____,figsize=($w:____,$h:____))
endtemplate


template |imshow|
imsow(____,interpolation='none',cmap='gray')
endtemplate


template |plt.savefig|
plt.savefig(____)
endtemplate


template |io-with|
with open($file:____,'$read_or_write:____') as $file_handle:____:
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


template |io.import|
# Init matrix to store data...
ids = []
mat = []

# Read $1:____.dat and load data into matrix...
f = '$1:____'
fi = "{STR}.dat".format( STR = f )
with open(fi,'r') as fh:
    for line in fh.readlines():
        words = line.split()
        if words[0] == "#": continue
        mat.append( [ float(it) for it in words[1:] ] )
        ids.append( int(words[0]) )  
endtemplate


template |pro.svd|
import os
from Gnuplot import Gnuplot
from numpy import std, sqrt, array, argsort
from numpy.linalg import svd, norm
from svdViz import *
import sys

# ___/ DATA INPUT \___

# Init matrix to store data...
ids = []
mat = []

# Read mol.dat and load data into matrix...
f = 'mol'
fi = "{STR}.dat".format( STR = f )
with open(fi,'r') as fh:
    for line in fh.readlines():
        words = line.split()
        if words[0] == "#": continue
        mat.append( [ float(it) for it in words[1:] ] )
        ids.append( int(words[0]) )  


# Normalize mat
mat = array(mat).T   # ...Let each col be a dataset
for i in range(len(mat)): mat[i] = mat[i] / norm(mat[i])


# Singular value decomposition (SVD)...
u, w, vt = svd(mat, full_matrices = False)
u[:,0]  = -u[:,0]    # ...Reverse item's primary feature
vt[0,:] = -vt[0,:]   # ...Reverse dataset's primary feature




# ___/ PLOTS \___

gp = Gnuplot(persist = False) 
FS = { "SCREEN" : 14,   "TIC" : 14,   "KEY" : 14, "LABEL" : 14 }
gp("set encoding iso_8859_1")
gp("set term postscript eps enhanced  color solid  '{FONT}' {FONTSIZE} \
    size {WIDTH}, {HEIGHT}".format( FONT  = "Helvetica", FONTSIZE = FS["SCREEN"],
                                    WIDTH = 7       , HEIGHT   = 6))
gp("set output '{FILE}'".format( FILE = 'w.eps' ))
plot_singular(gp, w, FS["SCREEN"], TOP = 3)




gp("set term postscript eps enhanced  color solid  '{FONT}' {FONTSIZE} \
    size {WIDTH}, {HEIGHT}".format( FONT  = "Helvetica", FONTSIZE = FS["SCREEN"],
                                    WIDTH = 7       , HEIGHT   = 6))
gp("set output '{FILE}'".format( FILE = 'u.eps' ))
gp("set origin 0.0, 0.0")
gp("set lmargin 10.0")
gp("set multiplot layout 3, 1")

# (3,1)
gp("unset xlabel")
gp("set tmargin 0")
gp("set bmargin 1.2")
gp("set offset graph 0.0, 0.0, 0.02, 0.02")
gp("set xtics in")
gp("set xtics in mirror")
gp("set size 1, 0.32")
U0_MIN, U0_MAX = min(u.T[0]), max(u.T[0])
plot_u(gp, u[:,0], FS, False, 'u_1', U0_MIN, U0_MAX)

# (3,2)
gp("set tmargin 0")
gp("set bmargin 1.8")
gp("set offset graph 0.0, 0.0, 0.02, 0.02")
gp("set xtics in mirror")
gp("set size 1, 0.32")
U1_MIN, U1_MAX = min(u.T[1]), max(u.T[1])
plot_u(gp, u[:,1], FS, False, 'u_2', U1_MIN, U1_MAX)

# (3,3)
U2_MIN, U2_MAX = min(u.T[2]), max(u.T[2])
gp("set tmargin 0.0")
gp("set bmargin 2.8")
gp("set offset graph 0.0, 0.0, 0.02, 0.02")
gp("set xtics offset 0")
gp("set xtics in mirror")
gp("set size 1, 0.34")
plot_u(gp, u[:,2], FS, True, 'u_3', U2_MIN, U2_MAX)

gp("unset multiplot")
gp("reset")




# Scatter plot...
gp("set term postscript eps enhanced  color solid  '{FONT}' {FONTSIZE} \
    size {WIDTH}, {HEIGHT}".format( FONT  = "Helvetica", FONTSIZE = FS["SCREEN"],
                                    WIDTH = 7       , HEIGHT   = 7))
gp("set output '{FILE}'".format( FILE = 'kv.eps' ))
gp("set lmargin 8")
gp("set origin 0.0, 0.0")
gp("set multiplot layout 2, 2")

# (1,1)
GRAPH_OFFSETS = (0.00, 0.00, 1.05, 0.00)
U_AVE = 1 / sqrt( len(u[:,0]) )
kv1 = vt[0] * w[0] * U_AVE
kv2 = vt[1] * w[1] * U_AVE
gp("set key reverse at 6.5,3.4 Lef")
gp("set ylabel offset 2")
## gp("set offset graph 0.00, 0.00, 1.05, 0.00")
gp("set offset graph 0.00, 0.00, 0.0, 0.00")
gp("set lmargin 8.0")
gp("set tmargin 3.0")
gp("set bmargin 2.0")
gp("set rmargin 2.0")
## gp("set arrow from {X0}, {Y0} to {X1}, {Y1} nohead ls 0".format( 
##     X0 = 3.5, Y0 = 0, 
##     X1 = 7.5, Y1 = 0))
scatter_vs(gp, kv1, kv2, FS, 'c_1', 'c_2')


# (1,2)
kv2 = vt[1] * w[1] * U_AVE
kv3 = vt[2] * w[2] * U_AVE
gp("unset key")
gp("set ylabel offset 2")
gp("set lmargin 6.0")
gp("set tmargin 3.0")
gp("set bmargin 2.0")
gp("set rmargin 2.5")
gp("set offset graph 0.00, 0.00, 0.0, 0.00")
## gp("set arrow from {X0}, {Y0} to {X1}, {Y1} nohead ls 0".format( 
##     X0 = -1.5, Y0 = 0, 
##     X1 = 1.5 , Y1 = 0))
## gp("set arrow from {X0}, {Y0} to {X1}, {Y1} nohead ls 0".format( 
##     X0 = 0.0, Y0 = -1.5, 
##     X1 = 0.0, Y1 =  3.5))
scatter_vs(gp, kv3, kv2, FS, 'c_3', 'c_2')

# (2,1)
kv1 = vt[0] * w[0] * U_AVE
kv3 = vt[2] * w[2] * U_AVE
gp("unset key")
gp("set lmargin 8.0")
gp("set ylabel offset 2")
gp("set offset graph 0.00, 0.00, 0.0, 0.00")
gp("set tmargin 2.0")
gp("set bmargin 4.0")
gp("set rmargin 2.0")
## gp("set arrow from {X0}, {Y0} to {X1}, {Y1} nohead ls 0".format( 
##     X0 = 3.5, Y0 = 0, 
##     X1 = 7.5, Y1 = 0))
scatter_vs(gp, kv1, kv3, FS, 'c_1', 'c_3')


gp("unset multiplot")
gp("reset")



if 0:
    # Density plot of datasets...
    FS   = { "SCREEN" : 12,   "TIC" : 24 }
    EPS  = "d.eps"
    YTICS = ids
    orders = argsort(YTICS)[ : :-1]
    labels = [ YTICS[i] for i in orders ]
    inps = array([ mat[:,i] for i in orders ])
    gp("reset")
    gp("set encoding iso_8859_1")
    set_io(gp, 4.85, 24.5, FS)
    gp("set output '{FILE}'".format( FILE = EPS ))
    plot_matrix(gp, inps, labels, FS, MISC = "")
endtemplate


template |tally|
box = {}
for it in $list:____: 
    if it not in box: box[it] = 1
    else: box[it] += 1
endtemplate
