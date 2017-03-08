using OpenMPIData
using PyPlot

filenameCalib = Pkg.dir("OpenMPIData","data","calibration","1.mdf")
filenameMeas = Pkg.dir("OpenMPIData","data","measurement","dicePhantom","1.mdf")

c = reconstruction(filenameCalib, filenameMeas, 3, 0.1)

figure(1)
clf()
imshow(reshape(abs(c),44,44))
gray()