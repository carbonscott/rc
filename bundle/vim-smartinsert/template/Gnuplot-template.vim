template |range|
set ____range [____:____]
endtemplate

template |ratio|
set size ratio ____
endtemplate

template |lc|
lc rgb '____'
endtemplate

template |color.blue_green|
"#21908d"
endtemplate

template |color.lime_green|
"#aadc32"
endtemplate

template |color.blue|
"#0c0887"
endtemplate

template |plot.vertical|
set parametric  # dummy t is avaialbe to use
                # x(t), y(t) for evaluating x and y by a given t

# Plot a vertical line along with a given data...
plot 'PhrB-TCEP.1p9A.hkl' u (log10($4)):(log10($5)) w p pt 0, 1, t
endtemplate

template |log|
set log xy

plot 'PhrB-TCEP.1p9A.hkl' u 4:5
endtemplate

template |plot.horizontal|
plot 'PhrB-TCEP.1p9A.hkl' u 4:5, 2
plot 'PhrB-TCEP.1p9A.hkl' u 4:5, x
plot 'PhrB-TCEP.1p9A.hkl' u 4:5, 2*x
plot 'PhrB-TCEP.1p9A.hkl' u 4:5, 0.5*x
endtemplate
