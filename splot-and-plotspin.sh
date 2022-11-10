set terminal eps size 6.2cm,6cm


set bmargin 2
set lmargin 5
set rmargin 0.5
set tmargin 0.2
show margin

#set style data lines
set nokey
fonttype = "Times, 12"
set zeroaxis

#set ylabel "E - E_F (eV)" font fonttype offset 0.75



#-------------------------
#setting line and font

#scale=0.01
#set multiplot

#unset key
#set origin 0,0
set size 1.0,1.0
set zeroaxis
#set grid
set xlabel 'k_x'font fonttype
set ylabel 'k_y' font fonttype
set zlabel 'E-E_F (eV) ' font fonttype rotate parallel

#insert data name here .MulPop file from FermiLoop example 'Au_111_PbS_ESM_G_FL_MC_Pb.MulPop'
datause1 = 'Au_3x3x3_PbS_2x2x1_FL.Pxyz_543'
datause2 = 'Au_3x3x3_PbS_2x2x1_FL.Pxyz_544'
fermi1 = 'Au_3x3x3_PbS_2x2x1_FL.FermiSurf_543'
fermi2 = 'Au_3x3x3_PbS_2x2x1_FL.FermiSurf_544'
#constant value
reduction = 4
Bohr2Ang=1./0.529177249

#-------------------------
# for spin colour range 
# for xy
plot datause2 u 1:6
# for yz
min_y = GPVAL_DATA_Y_MIN
max_y = GPVAL_DATA_Y_MAX

#automatic
#minN = min_y
#maxN = max_y

#manual
#manual
minN = -1
maxN = 1
centerN = (maxN - minN)/2 + minN
#--------------------------
# range for k
krange = 0.2
set xrange [-krange:krange]
set yrange [-krange:krange]
set zrange [-krange:krange]

set mytics 2
set mxtics 2

# range for energy
#set zrange [-0.1025:-0.0975]
set xtic 0.1
set ytic 0.1
set ztic 0.1



#pallete setting
set cbrange [minN:maxN]
# " s_z "centerN,
#set cbtics ("{/:Normal=20 ↓}" minN,  "{/:Normal=20 ↑}" maxN) font fonttype
set cbtics ("-1" minN,  "+1" maxN) font fonttype
set cblabel "s_z" font fonttype rotate parallel offset -2,0
set palette defined (minN "green", centerN "blue", maxN "red") 

#set label 1 center at first 0, 0 '+' front
set label 2 center at first 0, 0 "Γ" front


#for transform 3D to 2D
set pm3d map

#for spin up and spin down as color
# for 1 - xy configuration
#splot datause using 1:2:4:8:9:10:6:7:5 with vectors notitle linewidth 2 palette
# for 2 - yz configuration 
#splot datause using 2:3:4:9:10:8:6:7:5 with vectors notitle linewidth 2 palette

# for spin sz as color
#1 xy configuration for spin sz as color
#splot datause every reduction using 1:2:4:8:9:1:10 with vectors notitle linewidth 2 palette

splot datause1 every reduction using ($1*Bohr2Ang):($2*Bohr2Ang):3:4:5:6:($6/0.05) with vectors notitle linewidth 2 palette
replot datause2 every reduction using ($1*Bohr2Ang):($2*Bohr2Ang):3:4:5:6:($6/0.05) with vectors notitle linewidth 2 palette
replot fermi1 using ($1*Bohr2Ang):($2*Bohr2Ang):3 w l lw 2 lc "black" notitle
set output "Au-SPb-spin-sz.eps"
replot fermi2 using ($1*Bohr2Ang):($2*Bohr2Ang):3 w l lw 2 lc "black" notitle
#yz configuration
# splot datause every reduction using 2:3:4:9:10:1:(-$8) with vectors notitle linewidth 2 palette
#output name

pause -1

