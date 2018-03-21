using OpenMPIData

filenameCalib = Pkg.dir("OpenMPIData","data","calibrations","1.mdf")
#filenameCalib = Pkg.dir("OpenMPIData","data","calibrations","4.mdf")

### Shape Phantom
 phantom = "shapePhantom"
### Resolution Phantom
# phantom = "resolutionPhantom"
### Concentration Phantom
# phantom = "concentrationPhantom"

filenameMeas = Pkg.dir("OpenMPIData","data","measurements",phantom,"1.mdf")

#3D Volume
numPatchesY = 19
numPatchesZ = 19
SFsize=calibSize(MPIFile(filenameCalib))
C=zeros(SFsize[1],numPatchesY,numPatchesZ)

for y=1:numPatchesY
 for z=1:numPatchesZ
    st=(y-1)*19*1000+(z-1)*1000+1
    c = reconstruction(filenameCalib, filenameMeas, iterations=10, lambda=0.1,
                       minFreq=80e3, SNRThresh=5.0, recChannels=1:3,periods=st:st-1+1000,
                       bgCorrection=true)
    C[:,20-y,20-z]=c[:,div(SFsize[2],2)+1,div(SFsize[3],2)+1,1]
 end
end

s=size(C)
if phantom =="shapePhantom"
  filenameImage = Pkg.dir("OpenMPIData","data","reconstructions","$phantom","reconstruction1D.png")
  showMIPs(C,filename=filenameImage)
elseif phantom =="resolutionPhantom"
  slice=[div(s[1]+1,2),div(s[2]+1,2),div(s[3]+1,2)]
  filenameImage = Pkg.dir("OpenMPIData","data","reconstructions","$phantom","reconstruction1D.png")
  showSlices(C,slice,filename=filenameImage)
elseif phantom =="concentrationPhantom"
  slice1=[div(s[1],3)+1,div(s[2],3)+1,div(s[3],3)+1]
  slice2=[2*div(s[1],3)+1,2*div(s[2],3)+1,div(s[3],3)+1]
  filenameImage = Pkg.dir("OpenMPIData","data","reconstructions","$phantom","reconstruction1D_1.png")
  showSlices(C,slice1,filename=filenameImage,fignum=1)
  filenameImage = Pkg.dir("OpenMPIData","data","reconstructions","$phantom","reconstruction1D_2.png")
  showSlices(C,slice2,filename=filenameImage,fignum=2)
end

#Single Patch 1D Reco
#=
z=10
y=10
st=(z-1)*19*1000+(y-1)*1000+1
    c = reconstruction(filenameCalib, filenameMeas, iterations=5, lambda=0.1,
                       minFreq=80e3, SNRThresh=3.0, recChannels=1:3,periods=st:st-1+1000,
                       bgCorrection=true)

slice=[div(SFsize[1],2)+1,div(SFsize[2],2)+1,div(SFsize[3],2)+1]

filenameImage = Pkg.dir("OpenMPIData","data","reconstructions","$phantom","reconstruction$(phantom)1D_MIP.png")
showMIPs(c[:,:,:,1],filename=filenameImage,fignum=1)

filenameImage = Pkg.dir("OpenMPIData","data","reconstructions","$phantom","reconstruction$(phantom)1D_Slice.png")
showSlices(c[:,:,:,1],slice,filename=filenameImage,fignum=2)
=#
