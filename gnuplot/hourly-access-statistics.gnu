#set terminal png font "/usr/share/fonts/wqy-microhei/wqy-microhei.ttc"
#set output "hourly-access-statistics.png"
set terminal svg font "/usr/share/fonts/wqy-microhei/wqy-microhei.ttc"
set output "hourly-access-statistics.svg"

#set key left reverse Left spacing 1.5
set key bottom spacing 2

set xlabel "hour"
set ylabel "times"

set xtics 1

file = "hourly-access-statistics.dat"

plot file using 1:2 with linespoint title "hourly-access-statistics"
