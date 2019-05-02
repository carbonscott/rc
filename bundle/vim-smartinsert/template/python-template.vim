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
plt.subplots(__3__,__2__,figsize=(__w__,__h__))
endtemplate


template |imshow|
imsow(____,interpolation='none',cmap='gray')
endtemplate


template |plt.savefig|
plt.savefig(____)
endtemplate


template |io-with|
with open(__file__,'__read_or_write__') as __file_handle__:
    ____
endtemplate


template |argparse.import|
import argparse
endtemplate


template |argparse.creat_parser|
parser = argparse.ArgumentParser(
description = 
"""__description__"""
,formatter_class=argparse.RawTextHelpFormatter)
endtemplate


template |argparse.add_arg|
parser.add_argument("-____", "--____",
    required = __True__,
    metavar  = ("____"),
    type     = __int__,
    nargs    = ____,
    help     = """__help__""",)
endtemplate


template |argparse.arg_parse|
args = parser.parse_args()
endtemplate


template |argparse.positional|
parser.add_argument(
    '__var__', 
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

# Read __1__.dat and load data into matrix...
f = '__1__'
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
for it in __list__: 
    if it not in box: box[it] = 1
    else: box[it] += 1
endtemplate




# [[[ matplotlib ]]]
# {

template |matplotlib.setup|
from matplotlib import use; use('PS')
from mpl_toolkits.mplot3d import Axes3D
import matplotlib.pyplot as plt
from matplotlib import cm
from matplotlib.ticker import LinearLocator, FormatStrFormatter
import numpy as np
endtemplate


template |matplotlib.simple.plot|
x = np.linspace(__x_init__, __x_final__, __step__)
y = __function__(x)
plt.plot(x, y)
plt.show()
endtemplate


template |matplotlib.create.plot|
plt.figure(__1__, figsize = (__6__, __4__))
plt.plot(__x__, __y__, '__g-__', label = '__data_1__')
plt.xlabel('__x__')
plt.ylabel('__y__')
plt.legend(loc = '__upper right__', title = '__legend__')
plt.axhline(y = __0__, color = '__gray__', zorder = __-1__)
plt.axvline(x = __0__, color = '__gray__', zorder = __-1__)
plt.show()
endtemplate


template |matplotlib.plot.opt|
plt.plot(__x__, __y__, color = '__green__', 
                       marker = '__D__',
                       markerfacecolor = '__yellow__',
                       markersize = __7__,
                       markeredgecolor = '__C1__')
endtemplate


template |matplotlib.simple.errorbar|
plt.errorbar(__x__, __y__, fmt = '__oC1__', 
                                 label  = '__data__',
                                 xerr   = __0.75__,
                                 yerr   = __yerror__,
                                 ecolor = '__black__')
endtemplate


template |matplotlib.set.lim|
plt.__x__lim(__-8__, __8__)
endtemplate


template |matplotlib.simple.subplot|
__fig__, __axes__ = plt.subplot(__rows__, __cols__, figsize = (__9.5__, __6__)
axes[__0, 0__].plot(____)
__fig__.savefig(__'....eps'__)
endtemplate


template |matplotlib.simple.twinx|
__ax1__.twinx()
endtemplate


template |matplotlib.advanced.subplot|
# __Create a figure window...__
__fig__ = plt.figure(__1__, figsize=(__9__, __7__))

# __Subplot: __
__ax1__ = __fig__.add_subplot(__2__, __2__, __1__)
__ax1__.plot(__x__, __y__)
__ax1__.set_xlabel('__x__')
__ax1__.set_ylabel('__y__')
__ax1__.set_title('__title__')

# __Subplot: __
__ax2__ = __fig__.add_subplot(__2__, __2__, __1__)
__ax2__.plot(__x__, __y__)
__ax2__.set_xlabel('__x__')
__ax2__.set_ylabel('__y__')
__ax2__.set_title('__title__')

# __Export...__
__fig__.tight_layout()
fig.savefig('__path.pdf__')
fig.show()
endtemplate


template |mat.example.plot_surface|
fig = plt.figure()
ax = fig.gca(projection='3d')

# Make data...
X = np.arange(-5, 5, 0.25)
Y = np.arange(-5, 5, 0.25)
X, Y = np.meshgrid(X, Y)
R = np.sqrt(X**2 + Y**2)
Z = np.sin(R)

# Plot the surface...
surf = ax.plot_surface(X, Y, Z, cmap=cm.coolwarm,
                       linewidth=0, antialiased=False)

# Customize the z axis...
ax.set_zlim(-1.01, 1.01)
ax.zaxis.set_major_locator(LinearLocator(10))
ax.zaxis.set_major_formatter(FormatStrFormatter('%.02f'))

# Add a color bar which maps values to colors...
fig.colorbar(surf, shrink=0.5, aspect=5)

plt.show()
endtemplate

# }




# [[[ os.path module ]]]
# {

template |os.path.abspath|
os.path.abspath('__Downloads__')   # __returns '/Users/scott/Downloads'__
endtemplate


template |os.path.basename|
os.path.basename('__/foo/bar__')   # __returns 'bar'__
endtemplate


template |os.path.dirname|
os.path.dirname('__/Users/scott/Downloads/README.pdf__')   # __returns /Users/scott/Downloads__
endtemplate


template |os.path.exists|
os.path.exists('__path__')
endtemplate


template |os.path.join|
os.path.join('__parent_path__', '__child_path__')
endtemplate

# }




# [[[ string formating ]]]
# {

template |format.simple|
print "{__INT__:__04d__}, {__FLOAT__:__8.3f__}".format(__INT__ = ____, __FLOAT__ = ____)
endtemplate


template |format.align.left|
__<04d__
endtemplate


template |format.align.center|
__^10.3f__
endtemplate

# }
