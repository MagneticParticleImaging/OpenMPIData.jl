using OpenMPIData

#filenameCalib = Pkg.dir("OpenMPIData","data","calibrations","3.mdf")
#filenameCalib = Pkg.dir("OpenMPIData","data","calibrations","6.mdf")#High Resolution
filenameCalib = Pkg.dir("/mnt/results/OpenMPIData","data","calibrations","3.mdf")

### Cone Phantom
# phantom = "conePhantom"
### Resolution Phantom
# phantom = "resolutionPhantom"
### Concentration Phantom
 phantom = "concentrationPhantom"

#filenameMeas = Pkg.dir("OpenMPIData","data","measurements",phantom,"3.mdf")
filenameMeas = Pkg.dir("/mnt/results/OpenMPIData","data","measurements",phantom,"3.mdf")


c = reconstruction(filenameCalib, filenameMeas, iterations=3, lambda=0.001,
                   minFreq=80e3, SNRThresh=2.0, recChannels=1:3)

filenameImage = Pkg.dir("OpenMPIData","docs","src","assets","$phantom.png")

s=size(c)

if phantom =="conePhantom"
  filenameImage = Pkg.dir("OpenMPIData","docs","src","assets","$(phantom)MIP.png")
  showMIPs(c[:,:,:,1],filename=filenameImage)
elseif phantom =="resolutionPhantom"
  slice=[div(s[1]+1,2),div(s[2]+1,2),div(s[3]+1,2)]
  filenameImage = Pkg.dir("OpenMPIData","docs","src","assets","$(phantom)1.png")
  showSlices(c[:,:,:,1],slice,filename=filenameImage)
elseif phantom =="concentrationPhantom"
  slice1=[div(s[1],3)+1,div(s[2],3)+1,div(s[3],3)+1]
  slice2=[2*div(s[1],3)+1,2*div(s[2],3)+1,div(s[3],3)+1]
  filenameImage = Pkg.dir("OpenMPIData","docs","src","assets","$(phantom)1.png")
  showSlices(c[:,:,:,1],slice1,filename=filenameImage,fignum=1)
  filenameImage = Pkg.dir("OpenMPIData","docs","src","assets","$(phantom)2.png")
  showSlices(c[:,:,:,1],slice2,filename=filenameImage,fignum=2)
else 
  error("Wrong phantom selected. Please select conePhantom, resolutionPhantom or concentrationPhantom")
end
