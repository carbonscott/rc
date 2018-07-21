template |plot|
plot '____' u ____:____ w l
endtemplate

template |plot-for|
plot for [i=____:____] '____' u 1:i w l
endtemplate

template |plot.template|
#!/usr/bin/env gnuplot
reset
set terminal postscript eps size 3.5,2.62 enhanced color \
    font 'Helvetica neue,13' linewidth 2
set output "____"
set xlabel "____"
set ylabel "____"
set size ratio -1
plot '____' u ____
endtemplate

template |label|
set ____label "____"
endtemplate

template |title|
set title "____"
endtemplate

template |range|
set ____range [____:____]
endtemplate

template |tics|
set ____tics ____,____,____
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

template |term.png|
set terminal png size 3.5,2.62 enhanced color \
    font 'Helvetica,13' linewidth 2
endtemplate
