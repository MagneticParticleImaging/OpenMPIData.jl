using OpenMPIData

filenameCalib = Pkg.dir("OpenMPIData","data","calibrations","2.mdf")

### Cone Phantom
#phantom = "conePhantom"
### Resolution Phantom
phantom = "resolutionPhantom"
### Concentration Phantom
# phantom = "concentrationPhantom"

filenameMeas = Pkg.dir("OpenMPIData","data","measurements",phantom,"2.mdf")

numPatches = size(unflattenOffsetFieldShift(acqOffsetFieldShift(MPIFile(filenameMeas))[:,1,:]),1)


# 3D Volume
C = zeros(19,19,19)

for y=1:19
 #println(y)
 for z=1:19
   # print("$z,")
    st=(y-1)*19*1000+(z-1)*1000+1
    c = reconstruction(filenameCalib, filenameMeas, iterations=10, lambda=0.01,
                       minFreq=80e3, SNRThresh=5.0, recChannels=1:3,periods=st:st-1+1000,
                       bgCorrection=true)
    C[:,20-y,20-z]=c[:,10,10,1]
 end
end
filenameImage = Pkg.dir("OpenMPIData","docs","src","assets","$(phantom)1D.png")
slice=[10,10,10]
showSlices(C,slice,filename=filenameImage)


#=
#Single 1D

z=10
y=10
st=(z-1)*19*1000+(y-1)*1000+1

c = reconstruction(filenameCalib, filenameMeas, iterations=10, lambda=0.01,
                    minFreq=80e3, SNRThresh=5.0, recChannels=1:3,periods=st:st-1+1000)

filenameImage = Pkg.dir("OpenMPIData","docs","src","assets","$(phantom)1D.png")
slice=[10,10,10]
showSlices(c[:,:,:,1],slice)#,filename=filenameImage)
=#



