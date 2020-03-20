template |svd|
#!/usr/bin/env python3
# -*- coding: utf-8 -*-

import numpy as np
import GnuplotPy3

f = '__out_features.csv__'


def read(file):
    '''Return all lines in the user supplied parameter file without comments.
    '''
    lines = []   
    with open(file,'r') as fh:
        for line in fh.readlines():
            # Separate entries by spaces...
            words = line.replace('#', ' # ').split()

            # Handle comments...
            if "#" in words: words = words[  : words.index("#")]

            # Save non-empty line...
            words = [ float(word) for word in words ]
            if len(words) > 0: lines.append(words)
    
    return lines


lines = read(f)

lines = np.array(lines, copy = False)
u, s, vh = np.linalg.svd( lines.T, full_matrices = False )
c = np.matmul(np.diag(s), vh)


# [[[ Visualize SVD ]]]

if 1:
    # Singular values...
    gp = GnuplotPy3.GnuplotPy3()
    gp("set terminal postscript eps size 3.5, 2.62 enhanced color font 'Helvetica,14' linewidth 2")
    gp("set output 'polar_sing.eps'")
    gp("unset key")
    gp("set log xy")
    gp("set xlabel 'Rank of singular values'")
    gp("set ylabel 'Singular values'")
    gp("plot '-' using 1:2 with linespoints linetype 2 linewidth 1 linecolor rgb 'black'")

    for i, v in enumerate(s): gp(f"{i} {v}")
    gp("e")
    gp("exit")



if 1:
    # PC1...
    gp = GnuplotPy3.GnuplotPy3()
    gp("set terminal postscript eps size 3.5, 2.62 enhanced color font 'Helvetica,14' linewidth 2")
    gp("set output 'polar_pc1.eps'")
    gp("unset key")
    gp("set xlabel 'Polar atoms'")
    gp("set ylabel 'PC1'")
    gp("plot '-' using 1:2 with points linetype 2 linewidth 1 linecolor rgb 'black'")

    for i, v in enumerate(u[:,0]): gp(f"{i} {v}")
    gp("e")
    gp("exit")


if 1:
    # PC2...
    gp = GnuplotPy3.GnuplotPy3()
    gp("set terminal postscript eps size 3.5, 2.62 enhanced color font 'Helvetica,14' linewidth 2")
    gp("set output 'polar_pc2.eps'")
    gp("unset key")
    gp("set xlabel 'Polar atoms'")
    gp("set ylabel 'PC2'")
    gp("plot '-' using 1:2 with points linetype 2 linewidth 1 linecolor rgb 'black'")

    for i, v in enumerate(u[:,1]): gp(f"{i} {v}")
    gp("e")
    gp("exit")


if 0:
    # PC3...
    gp = GnuplotPy3.GnuplotPy3()
    gp("set terminal postscript eps size 3.5, 2.62 enhanced color font 'Helvetica,14' linewidth 2")
    gp("set output 'polar_pc3.eps'")
    gp("unset key")
    gp("set xlabel 'Polar atoms'")
    gp("set ylabel 'PC3'")
    gp("plot '-' using 1:2 with points linetype 2 linewidth 1 linecolor rgb 'black'")

    for i, v in enumerate(u[:,2]): gp(f"{i} {v}")
    gp("e")
    gp("exit")


if 0:
    # PC4...
    gp = GnuplotPy3.GnuplotPy3()
    gp("set terminal postscript eps size 3.5, 2.62 enhanced color font 'Helvetica,14' linewidth 2")
    gp("set output 'polar_pc4.eps'")
    gp("unset key")
    gp("set xlabel 'Polar atoms'")
    gp("set ylabel 'PC4'")
    gp("plot '-' using 1:2 with points linetype 2 linewidth 1 linecolor rgb 'black'")

    for i, v in enumerate(u[:,3]): gp(f"{i} {v}")
    gp("e")
    gp("exit")


if 1:
    # PC1 vs PC2...
    gp = GnuplotPy3.GnuplotPy3()
    gp("set terminal postscript eps size 3.5, 2.62 enhanced color font 'Helvetica,14' linewidth 2")
    gp("set output 'pc_1v2.pro.eps'")
    gp("unset key")
    gp("set xlabel 'c_1'")
    gp("set ylabel 'c_2'")

    gp("plot '-' using 1:2 with point pointtype 7 pointsize 0.5 linecolor rgb 'blue'")
    for i in range(len(c[0])): 
        gp(f"{c[0, i]} {c[1,i]}")  # ...v[4] represents angle, [0] is the interplanar angle between AB
    gp("e")
    gp("exit")



if 1:
    # PC1 vs PC3...
    gp = GnuplotPy3.GnuplotPy3()
    gp("set terminal postscript eps size 3.5, 2.62 enhanced color font 'Helvetica,14' linewidth 2")
    gp("set output 'pc_1v3.pro.eps'")
    gp("unset key")
    gp("set xlabel 'c_1'")
    gp("set ylabel 'c_3'")

    gp("plot '-' using 1:2 with point pointtype 7 pointsize 0.5 linecolor rgb 'blue'")
    for i in range(len(c[0])): 
        gp(f"{c[0, i]} {c[2,i]}")  # ...v[4] represents angle, [0] is the interplanar angle between AB
    gp("e")
    gp("exit")


if 1:
    # PC1 vs PC4...
    gp = GnuplotPy3.GnuplotPy3()
    gp("set terminal postscript eps size 3.5, 2.62 enhanced color font 'Helvetica,14' linewidth 2")
    gp("set output 'pc_1v4.pro.eps'")
    gp("unset key")
    gp("set xlabel 'c_1'")
    gp("set ylabel 'c_4'")

    gp("plot '-' using 1:2 with point pointtype 7 pointsize 0.5 linecolor rgb 'blue'")
    for i in range(len(c[0])): 
        gp(f"{c[0, i]} {c[3,i]}")  # ...v[4] represents angle, [0] is the interplanar angle between AB
    gp("e")
    gp("exit")





if 1:
    # PC2 vs PC3...
    gp = GnuplotPy3.GnuplotPy3()
    gp("set terminal postscript eps size 3.5, 2.62 enhanced color font 'Helvetica,14' linewidth 2")
    gp("set output 'pc_2v3.pro.eps'")
    gp("unset key")
    gp("set xlabel 'c_2'")
    gp("set ylabel 'c_3'")

    gp("plot '-' using 1:2 with point pointtype 7 pointsize 0.5 linecolor rgb 'blue'")
    for i in range(len(c[0])): 
        gp(f"{c[1, i]} {c[2,i]}")  # ...v[4] represents angle, [0] is the interplanar angle between AB
    gp("e")
    gp("exit")


if 1:
    # PC2 vs PC4...
    gp = GnuplotPy3.GnuplotPy3()
    gp("set terminal postscript eps size 3.5, 2.62 enhanced color font 'Helvetica,14' linewidth 2")
    gp("set output 'pc_2v4.pro.eps'")
    gp("unset key")
    gp("set xlabel 'c_2'")
    gp("set ylabel 'c_4'")

    gp("plot '-' using 1:2 with point pointtype 7 pointsize 0.5 linecolor rgb 'blue'")
    for i in range(len(c[0])): 
        gp(f"{c[1, i]} {c[3,i]}")  # ...v[4] represents angle, [0] is the interplanar angle between AB
    gp("e")
    gp("exit")


if 1:
    # PC3 vs PC4...
    gp = GnuplotPy3.GnuplotPy3()
    gp("set terminal postscript eps size 3.5, 2.62 enhanced color font 'Helvetica,14' linewidth 2")
    gp("set output 'pc_3v4.pro.eps'")
    gp("unset key")
    gp("set xlabel 'c_3'")
    gp("set ylabel 'c_4'")

    gp("plot '-' using 1:2 with point pointtype 7 pointsize 0.5 linecolor rgb 'blue'")
    for i in range(len(c[0])): 
        gp(f"{c[2, i]} {c[3,i]}")  # ...v[4] represents angle, [0] is the interplanar angle between AB
    gp("e")


       
endtemplate


template |svd.viz_dataset|
# [[[ Visualize ]]]

gp = GnuplotPy3.GnuplotPy3()

gp("set palette defined(\\")
gp("    0       0.2314  0.2980  0.7529,\\")
gp("    0.03125 0.2667  0.3529  0.8000,\\")
gp("    0.0625  0.3020  0.4078  0.8431,\\")
gp("    0.09375 0.3412  0.4588  0.8824,\\")
gp("    0.125   0.3843  0.5098  0.9176,\\")
gp("    0.15625 0.4235  0.5569  0.9451,\\")
gp("    0.1875  0.4667  0.6039  0.9686,\\")
gp("    0.21875 0.5098  0.6471  0.9843,\\")
gp("    0.25    0.5529  0.6902  0.9961,\\")
gp("    0.28125 0.5961  0.7255  1.0000,\\")
gp("    0.3125  0.6392  0.7608  1.0000,\\")
gp("    0.34375 0.6824  0.7882  0.9922,\\")
gp("    0.375   0.7216  0.8157  0.9765,\\")
gp("    0.40625 0.7608  0.8353  0.9569,\\")
gp("    0.4375  0.8000  0.8510  0.9333,\\")
gp("    0.46875 0.8353  0.8588  0.9020,\\")
gp("    0.5     0.8667  0.8667  0.8667,\\")
gp("    0.53125 0.8980  0.8471  0.8196,\\")
gp("    0.5625  0.9255  0.8275  0.7725,\\")
gp("    0.59375 0.9451  0.8000  0.7255,\\")
gp("    0.625   0.9608  0.7686  0.6784,\\")
gp("    0.65625 0.9686  0.7333  0.6275,\\")
gp("    0.6875  0.9686  0.6941  0.5804,\\")
gp("    0.71875 0.9686  0.6510  0.5294,\\")
gp("    0.75    0.9569  0.6039  0.4824,\\")
gp("    0.78125 0.9451  0.5529  0.4353,\\")
gp("    0.8125  0.9255  0.4980  0.3882,\\")
gp("    0.84375 0.8980  0.4392  0.3451,\\")
gp("    0.875   0.8706  0.3765  0.3020,\\")
gp("    0.90625 0.8353  0.3137  0.2588,\\")
gp("    0.9375  0.7961  0.2431  0.2196,\\")
gp("    0.96875 0.7529  0.1569  0.1843,\\")
gp("    1       0.7059  0.0157  0.1490\\")
gp("    ) ")


gp("set terminal postscript eps  size 3.5, 2.62 \\")
gp("                             enhanced color \\")
gp("                             font 'Helvetica,14' \\")
gp("                             linewidth 2")
gp("set output 'tmp.eps'")

gp("plot '-' with image")
for i, x in enumerate(lines):
    for j, y in enumerate(x):
        gp(f"{i} {j} {y}")
gp("e")
gp("exit")


for j in range(0,10):
    gp("set terminal postscript eps  size 3.5, 2.62 \\")
    gp("                             enhanced color \\")
    gp("                             font 'Helvetica,14' \\")
    gp("                             linewidth 2")
    gp(f"set output 'tmp_{j}.eps'")

    gp("unset key")

    gp("plot '-' using 1:2 with points linetype 7 linewidth 0.5 pointsize 0.5")
    for i, v in enumerate(lines[j]): 
        gp(f"{i} {v}")  
    gp("e")
    gp("reset")
endtemplate


template |histogram|
def showHistogram(data, bin, title, visual = True):
    # Find histogram...
    data_val, data_rng = np.histogram(data, bins = bin)

    print("Histogram -- {S}".format( S = title ))
    for i in range(len(data_val)):
        print("{M:12.7f} - {X:12.7f}: {N:<10d}".format( M = data_rng[i], X = data_rng[i+1], N = data_val[i] ))
    print

    if visual:
        gp = GnuplotPy3.GnuplotPy3()
        gp("set terminal postscript eps  size 3.5, 2.62 \\")
        gp("                             enhanced color \\")
        gp("                             font 'Helvetica,14' \\")
        gp("                             linewidth 2")
        gp(f"set output '{title}.eps'")
        gp("unset key")

        gp("plot '-' using 1:2 with lines linewidth 1 linecolor rgb 'black'")

        for i in range(len(data_val)): 
            gp(f"{data_rng[i]} {data_val[i]}")  
            gp(f"{data_rng[i+1]} {data_val[i]}")  
        gp("e")
endtemplate
