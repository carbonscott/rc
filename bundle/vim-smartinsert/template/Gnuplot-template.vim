template |eps|
gp("set terminal postscript eps  size __3.5__, __2.62__ \\")
gp("                             enhanced color \\")
gp("                             font 'Helvetica,14' \\")
gp("                             linewidth 2")
gp("set output '__filename__.eps'")
endtemplate


template |pdf|
gp("set terminal pdf size __3.5__, __2.62__ \\")
gp("                 enhanced color \\")
gp("                 font 'Helvetica,14' \\")
gp("                 linewidth 1")
gp("set output '__filename__.pdf'")


template |set.xrange|
gp("set xrange [__0__:__4__]")    # ...Set the range
gp("set xtics __0.5__")       # ...Set the step size of each tic along that axis
endtemplate


template |set.colorbar|
gp("set cbrange [__0__:__1__]")
__gp("set logscale cb")__     # ...Use logscale for the colorba
endtemplate


template |set.logscale.all|
gp("set log x")
gp("set log y")
gp("set logscale cb")
endtemplate


template |set.logscale.x|
gp("set log x")
endtemplate


template |set.logscale.y|
gp("set log y")
endtemplate


template |set.logscale.cb|
gp("set logscale cb")
endtemplate


template |set.label.xtics_add|
gp(f"set __xtics__ add ('{__0.25__}' __0.25__)")
endtemplate


template |set.label.xtics_step|
gp(f"set __xtics__ __0.5__")
endtemplate


template |set.label.xtics_rotate|
gp(f"set __xtics__ add ('{__0.25__}' __0.25__)  rotate by __90__ right")
endtemplate


template |set.aspect|
# The x and y axes will have the same step size...
gp("set size ratio -1”)

# The x and y axes will have the same length...
gp("set view equal_axes")
endtemplate


template |set.font.size|
gp("set __xtics__ font ', __1__'")
endtemplate


template |plot.with.label_point|
gp("__plot__ '-' using __1__:__2__:__3__  with labels point    \\")
gp("                      pointtype 7          \\")
gp("                      pointsize 0.5        \\")
gp("                      linecolor rgb 'black'\\")
gp("                      offset char .5,.2    \\")
gp("                      font ',6'            \\")
gp("                      title '__title__'__, \\__")
endtemplate


template |plot.2d_label|
for i in __range(len(something))__: 
    gp(f"{__X__} {__Y__} {__L__}")  
gp("e")
endtemplate


template |plot.2d|
for i in __range(len(something))__: 
    gp(f"{__X__} {__Y__}")  
gp("e")
endtemplate


template |set.object.arrow|
gp(f"set arrow from __90__,__-90__ to __90__,__270__  nohead  lw 1  lt 0")
endtemplate


template |palette.bluered|
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
endtemplate
