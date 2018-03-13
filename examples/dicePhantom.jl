using OpenMPIData
using PyPlot

filenameCalib = Pkg.dir("OpenMPIData","data","calibrations","1.mdf")
filenameMeas = Pkg.dir("OpenMPIData","data","measurements","dicePhantom","1.mdf")

c = reconstruction(filenameCalib, filenameMeas, iterations=3, lambda=0.0001,
                   minFreq=30e3, SNRThresh=1.8, recChannels=1:2)

figure(1)
clf()
imshow(reshape(abs.(c),44,44), interpolation="nearest")
gray()
