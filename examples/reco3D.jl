using OpenMPIData

filenameCalib = Pkg.dir("OpenMPIData","data","calibrations","3.mdf")

### Cone Phantom
 phantom = "conePhantom"
### Resolution Phantom
# phantom = "resolutionPhantom"
### Concentration Phantom
# phantom = "concentrationPhantom"

filenameMeas = Pkg.dir("OpenMPIData","data","measurements",phantom,"3.mdf")


c = reconstruction(filenameCalib, filenameMeas, iterations=3, lambda=0.0001,
                   minFreq=30e3, SNRThresh=1.8, recChannels=1:3)

filenameImage = Pkg.dir("OpenMPIData","docs","src","assets","$phantom.png")
showMIPs(c[:,:,:,1],filename=filenameImage)



