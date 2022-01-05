template |bin_image|
def bin_image(img_orig, bin = 4, mode = 0):
    X, Y = img_orig.shape

    # Binning for faster display...
    if mode == 0:
        img_bin = []
        for i in range(0, X, bin):
            for j in range(0, Y, bin):
                img_bin.append( (i, j, np.mean(img_orig[i : min(i + bin, X), j : min(j + bin, Y)])) )

    if mode == 1:
        img_bin = []
        for i in range(0, X, bin):
            img_bin_y = []
            for j in range(0, Y, bin):
                img_bin_y.append( np.mean(img_orig[i : min(i + bin, X), j : min(j + bin, Y)] ) )
            img_bin.append(img_bin_y)

    return img_bin
endtemplate


template |py_bs|
py_bs = os.path.basename(__file__)[:-3]
endtemplate


template |read|
def read(file, numerical = False):
    '''Return all lines in the user supplied parameter file without comments.
    '''
    lines = []
    with open(file,'r') as fh:
        for line in fh.readlines():
            # Separate entries by spaces and remove commented lines...
            words = line.replace('#', ' # ').split()

            # Omit any thing coming after the pound sign in a line...
            if "#" in words: words = words[  : words.index("#")]

            # Save non-empty line...
            if numerical: words = [ float(word) for word in words ]
            if len(words) > 0: lines.append(words)

    return lines
endtemplate


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


template |show_histogram|
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


template |show_image|
def showImage(img_disp, bin, rng, title):
    X, Y = img_disp.shape

    # Binning for faster display...
    img_bin = []
    bin = args.bin
    for i in range(0, X, bin):
        for j in range(0, Y, bin):
            img_bin.append( (i, j, np.mean(img_disp[i : min(i + bin, X), j : min(j + bin, Y)])) )

    # Gnuplot...
    gp = GnuplotPy3.GnuplotPy3()
    gp('set terminal postscript eps size 3.5, 2.62 \\'     )
    gp('                            enhanced color \\'     )
    gp("                            font 'Helvetica,14' \\")
    gp('                            linewidth 2'          )
    gp(f"set output '{title}.eps'")
    gp("unset key")
    ## gp("set palette gray")
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
    gp(f"set cbrange [{rng[0]}:{rng[1]}]")

    cmd  = "plot "
    cmd += "'-' w image"
    gp(cmd)
    for i in img_bin:
        gp( "{X} {Y} {V}".format(X = i[0], Y = i[1], V = i[2]) )
    gp('e')
endtemplate


template |show_FourierSpectrum|
def showFourierSpectrum(data, title, rng = [], visual = True):
    '''Visualize a the squared magnitude of a Fourier spectrum.
    '''
    # Calcuate the Fourier transform...
    fs = np.fft.fft2(data)

    # Calcuate the power spectrum...
    # ...Shift the center
    fs = np.fft.fftshift(fs)

    # ...Power spectrum
    ps = np.log( 1 + np.abs(fs) )
    ps /= np.max(ps)

    # Visualize...
    if visual:
        gp = GnuplotPy3.GnuplotPy3()
        gp('set terminal postscript eps size 3.5, 2.62 \\'     )
        gp('                            enhanced color \\'     )
        gp("                            font 'Helvetica,14' \\")
        gp('                            linewidth 2'          )
        gp(f"set output '{title}.eps'")
        gp("unset key")
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

        if len(rng) == 2: gp(f"set cbrange [{rng[0]}:{rng[1]}]")
        else: gp(f"set cbrange [{np.min(ps)}:{np.max(ps)}]")

        cmd  = "plot "
        cmd += "'-' w image"
        gp(cmd)
        for i in range(ps.shape[0]):
            for j in range(ps.shape[1]):
                gp( f"{i} {j} {ps[i, j]}" )
        gp('e')
endtemplate


template |read_csv|
def read_csv(file):
    '''Return all lines in the user supplied parameter file without comments.
    '''
    lines = []
    with open(file,'r') as fh:
        for line in fh.readlines():
            # Separate entries by commas and remove commented lines...
            words = line.replace('\n', '').split(',')

            lines.append(words)

    return lines

endtemplate


template |fit.functions|
# [[[ Optimization function  ]]]

def gau(x, sigma):
    ''' It returns the core part of the model -- e.g. a Gaussian function for 
        building the model.
    '''
    return np.exp( - x * x / (2 * sigma * sigma) )


def model(params, x):
    ''' Model function -- e.g. the peak of Gaussian function
        keep param arguments at the end.
    '''
    A, B, x0, sigma = params
    return A * gau(x - x0, sigma) + B


def residual(params, X, y):
    '''      ~~~~~~  ~  ~
               ^     ^  ^
               :     |  :
               :     |  :... data
               :     |
               :     |___ variable
               :
               :... `params` has to be the first argument, which is required by 
                    `least_squares` function

        It returns the residuals between model and data.  
    '''
    res  = model(params, X) - y
    return res.reshape(-1)


def fit(params, mask, X, y):
    ''' It wraps the fitting procedure and returns the result.  
    '''
    # Create a cost function based on masked parameters...
    def cost(subparam_vals):
        # Assign subparam values to `params` according to `mask`...
        set_subparams(params, mask, subparam_vals)
        return residual(params, X, y)

    # Return masked parameters as a list...
    init = fetch_subparams(params, mask)

    # Optimize...
    result = optimize.least_squares(cost, init, method = 'lm')
    return result


def build_mask_table(labels):
    """ `labels` is a list of strings. Each string represents the name of a
        specific paramter.
        The function will return both a mask and a table (dict).
    """
    # Return boolean mask, table...
    return [ True for i in range(len(labels)) ], \
           { labels[i] : i for i in range(len(labels)) }


def params_off(mask, table, label, val = True):
    """ `params` is a list of parameters. `params` can be turned on and off by giving
        the label of the parameter and `val`. `val` is True by default. `table` shows
        the order of parameters.
    """
    mask[ table[label] ] = ( not val )


def fetch_subparams(params, mask):
    """ Returns a subset of params according to the Trueness in `mask`.
    """
    return [ params[i] for i in range(len(params)) if mask[i] ]


def set_subparams(params, mask, subparam_vals):
    ''' Assign subparam values to `params` according to the Trueness `mask`.
    '''
    j = 0
    for i in range(len(params)):
        if mask[i]: 
            params[i] = subparam_vals[j]
            j += 1
endtemplate


template |fit.mask|
# Create mask for multi-stages refinement...
labels = [ __"Intensity", "Baseline", "Peak", "Width"__ ]
mask, table = build_mask_table(labels)
endtemplate


template |fit.run|
for it in __"Intensity Width"__.split(): params_off(mask, table, it)
result = fit(params, mask, X, y)
set_subparams(params, mask, result.x)
__A_fit, B_fit, x0_fit, sigma_fit__ = params
endtemplate


template |fit.mask_all_true|
mask = [True for it in mask]
endtemplate
