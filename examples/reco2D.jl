using OpenMPIData

#filenameCalib = Pkg.dir("OpenMPIData","data","calibrations","2.mdf")
filenameCalib = Pkg.dir("/mnt/mpiresults/OpenMPIData","data","calibrations","2.mdf")

### Cone Phantom
#phantom = "conePhantom"
### Resolution Phantom
phantom = "resolutionPhantom"
### Concentration Phantom
# phantom = "concentrationPhantom"

#filenameMeas = Pkg.dir("OpenMPIData","data","measurements",phantom,"2.mdf")
filenameMeas = Pkg.dir("/mnt/mpiresults/OpenMPIData","data","measurements","$(phantom)","2.mdf")

numPatches=size(unflattenOffsetFieldShift(acqOffsetFieldShift(MPIFile(filenameMeas))[:,1,:]),1)

C=zeros(19,19,numPatches)

for i=1:numPatches
 c = reconstruction(filenameCalib, filenameMeas, iterations=3, lambda=0.01,
                   minFreq=80e3, SNRThresh=10.0, recChannels=1:3,periods=(i-1)*1000+1:i*1000)
 C[:,:,i]=c[:,:,10,1]
end
filenameImage = Pkg.dir("OpenMPIData","docs","src","assets","$(phantom)2D.png")
slice=[10,10,10]
showSlices(C,slice,filename=filenameImage)



#2D Reco
#=
st=10*1000+1
c = reconstruction(filenameCalib, filenameMeas, iterations=3, lambda=0.01,
                   minFreq=80e3, SNRThresh=10.0, recChannels=1:3,periods=st:st-1+1000)

filenameImage = Pkg.dir("OpenMPIData","docs","src","assets","$(phantom)2D.png")
slice=[10,10,10]
showSlices(c[:,:,:,1],slice,filename=filenameImage)
=#
     



