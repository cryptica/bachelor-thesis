
set xlabel "n"
set grid
set logscale y

set key left top

set terminal pdf size 8cm, 5cm

set title "Runtime"
set ylabel "t (s)"

set style line 1 linecolor rgb "red" pointtype 2
set style line 2 linecolor rgb "green" pointtype 1

set style line 3 linecolor rgb "red" pointtype 0
set style line 4 linecolor rgb "green" pointtype 0
set style line 5 linecolor rgb "blue" pointtype 0
set style line 6 linecolor rgb "violet" pointtype 0

set output 'bench_wide_flat_time.pdf'

plot "bench_wide_flat.log" index 0 using 2:3 with linespoints ls 1 title columnheader(1),\
     "bench_wide_flat.log" index 1 using 2:3 with linespoints ls 2 title columnheader(1)

set output 'bench_wide_deep_time.pdf'

plot "bench_wide_deep.log" index 0 using 2:3 with linespoints ls 1 title columnheader(1),\
     "bench_wide_deep.log" index 1 using 2:3 with linespoints ls 2 title columnheader(1)

unset logscale y

f(x) = a1*(x - a2)**3
a0 = 0
a1 = 1
a2 = 1
a3 = 0
a4 = 0
a5 = 0

fit f(x) "bench_const_deep.log" index 0 using 2:3 via a1, a2

set output 'bench_const_deep_time.pdf'

plot "bench_const_deep.log" index 0 using 2:3 with linespoints ls 3 title columnheader(1),\
     "bench_const_deep.log" index 1 using 2:3 with linespoints ls 4 title columnheader(1),\
     "bench_const_deep.log" index 2 using 2:3 with linespoints ls 5 title columnheader(1),\
     "bench_const_deep.log" index 3 using 2:3 with linespoints ls 6 title columnheader(1),\
     f(x)

set logscale y

set title "Number of rules"
set ylabel "rules"
set output 'bench_wide_flat_rules.pdf'

plot "bench_wide_flat.log" index 0 using 2:4 with linespoints ls 1 title columnheader(1),\
     "bench_wide_flat.log" index 1 using 2:4 with linespoints ls 2 title columnheader(1)

set output 'bench_wide_deep_rules.pdf'

plot "bench_wide_deep.log" index 0 using 2:4 with linespoints ls 1 title columnheader(1),\
     "bench_wide_deep.log" index 1 using 2:4 with linespoints ls 2 title columnheader(1)

unset logscale y

set output 'bench_const_deep_rules.pdf'

plot "bench_const_deep.log" index 0 using 2:4 with linespoints ls 3 title columnheader(1),\
     "bench_const_deep.log" index 1 using 2:4 with linespoints ls 4 title columnheader(1),\
     "bench_const_deep.log" index 2 using 2:4 with linespoints ls 5 title columnheader(1),\
     "bench_const_deep.log" index 3 using 2:4 with linespoints ls 6 title columnheader(1)

