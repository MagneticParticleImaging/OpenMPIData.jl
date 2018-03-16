using OpenMPIData

#filenameCalib = Pkg.dir("OpenMPIData","data","calibrations","2.mdf")
filenameCalib = Pkg.dir("/home/szwargulski/mpiresults/OpenMPIData","data","calibrations","1.mdf")

### Cone Phantom
# phantom = "conePhantom"
### Resolution Phantom
phantom = "resolutionPhantom"
### Concentration Phantom
# phantom = "concentrationPhantom"

#filenameMeas = Pkg.dir("OpenMPIData","data","measurements",phantom,"2.mdf")
#filenameMeas = Pkg.dir("OpenMPIData","data","measurements",phantom,"2.mdf")
filenameMeas = Pkg.dir("/home/szwargulski/mpiresults/OpenMPIData","data","measurements","resolutionPhantom","1.mdf")


p=(19*9+9)*1000+1
c = reconstruction(filenameCalib, filenameMeas, iterations=10, lambda=0.0001,
                   minFreq=30e3, SNRThresh=2.0, recChannels=1:3,periods=p:p-1+1000)


filenameImage = Pkg.dir("OpenMPIData","docs","src","assets","$(phantom)1D.png")
#showMIPs(c[:,:,:,1],filename=filenameImage)
slice=[9,9,9]
showSlices(c[:,:,:,1],slice,filename=filenameImage)

~      



