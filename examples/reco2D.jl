using OpenMPIData

#filenameCalib = Pkg.dir("OpenMPIData","data","calibrations","2.mdf")
filenameCalib = Pkg.dir("/home/knopp/mpiresults/OpenMPIData","data","calibrations","2.mdf")

### Cone Phantom
# phantom = "conePhantom"
### Resolution Phantom
phantom = "resolutionPhantom"
### Concentration Phantom
# phantom = "concentrationPhantom"

#filenameMeas = Pkg.dir("OpenMPIData","data","measurements",phantom,"2.mdf")
#filenameMeas = Pkg.dir("OpenMPIData","data","measurements",phantom,"2.mdf")
filenameMeas = Pkg.dir("/home/knopp/mpiresults/OpenMPIData","data","measurements","resolutionPhantom","2.mdf")

c = reconstruction(filenameCalib, filenameMeas, iterations=3, lambda=0.01,
                   minFreq=80e3, SNRThresh=5.0, recChannels=1:3,periods=9001:10000)


filenameImage = Pkg.dir("OpenMPIData","docs","src","assets","$(phantom)2D.png")
#showMIPs(c[:,:,:,1],filename=filenameImage)
slice=[9,9,9]
showSlices(c[:,:,:,1],slice,filename=filenameImage)

~      



