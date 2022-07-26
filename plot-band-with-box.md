
set term eps size 4cm,3cm font "Times,11"
set output "Au-Pb-S-configuration-band.eps"
set multiplot

reduction=1
#reduction=20
linewidth=3
set nokey
set zeroaxis
set mytics 5
set tics 1
set grid
set ylabel 'E-E_F (eV)'
set xrange [0.000000:0.606225]
set yrange [-2.000000:2.00000]
E_bot = -0.15 
E_top = 0.15
M = 0.478115
L = 0.256221 - 0.256221/4
R = 0.256221 + (0.478115-0.256221)/4
G = 0.256221
set object rectangle from L,E_bot to R,E_top behind fillcolor 'light-blue' fillstyle solid border lc "blue"
set label center at G,0.35 "A" font "Times,9" tc "blue"
set xtics ('K' 0.000000, '{/Symbol G}' 0.256221, 'M' 0.478115, 'K' 0.606225)
plot 'Au_3x3x3_PbS_2x2x1_G_BD.BAND' every 1 using 1:2 with lines notitle linewidth 1
pause -1

![Au-Pb-S-configuration-band](https://user-images.githubusercontent.com/82867349/181043169-c3065617-06a3-4426-ab70-f1bd41031295.png)
