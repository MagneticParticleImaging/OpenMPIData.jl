using OpenMPIData

filenameCalib = Pkg.dir("OpenMPIData","data","calibrations","2.mdf")
#filenameCalib = Pkg.dir("OpenMPIData","data","calibrations","5.mdf")

### Shape Phantom
 phantom = "shapePhantom"
### Resolution Phantom
# phantom = "resolutionPhantom"
### Concentration Phantom
# phantom = "concentrationPhantom"

filenameMeas = Pkg.dir("OpenMPIData","data","measurements",phantom,"2.mdf")

numPatchesZ = 19
SFsize=calibSize(MPIFile(filenameCalib))
C=zeros(SFsize[1:2]...,numPatchesZ)

for i=1:numPatchesZ
 c = reconstruction(filenameCalib, filenameMeas, iterations=3, lambda=0.1,
                    minFreq=80e3, SNRThresh=3.0, recChannels=1:3,
                    periods=(i-1)*1000+1:i*1000,bgCorrection=true)
 C[:,:,20-i]=c[:,:,div(SFsize[3],2)+1,1]
end
mkpath("../data/reconstrcutions/$(phantom)/")
s=size(C)
if phantom =="shapePhantom"
  filenameImage = Pkg.dir("OpenMPIData","data","reconstructions","$phantom","reconstruction2D.png")
  showMIPs(C,filename=filenameImage)
elseif phantom =="resolutionPhantom"
  slice=[div(s[1]+1,2),div(s[2]+1,2),div(s[3]+1,2)]
  filenameImage = Pkg.dir("OpenMPIData","data","reconstructions","$phantom","reconstruction2D.png")
  showSlices(C,slice,filename=filenameImage)
elseif phantom =="concentrationPhantom"
  slice1=[div(s[1],3)+1,div(s[2],3)+1,div(s[3],3)+1]
  slice2=[2*div(s[1],3)+1,2*div(s[2],3)+1,div(s[3],3)+1]
  filenameImage = Pkg.dir("OpenMPIData","data","reconstructions","$phantom","reconstruction2D_1.png")
  showSlices(C,slice1,filename=filenameImage,fignum=1)
  filenameImage = Pkg.dir("OpenMPIData","data","reconstructions","$phantom","reconstruction2D_2.png")
  showSlices(C,slice2,filename=filenameImage,fignum=2)
end

#Single Patch 2D Reco
#=
st=10*1000+1
c = reconstruction(filenameCalib, filenameMeas, iterations=3, lambda=0.1,
                   minFreq=80e3, SNRThresh=3.0, recChannels=1:3,periods=st:st-1+1000, bgCorrection=true)

slice=[div(SFsize[1],2)+1,div(SFsize[2],2)+1,div(SFsize[3],2)+1]
filenameImage = Pkg.dir("OpenMPIData","data","reconstructions","$phantom","reconstruction$(phantom)2D_MIP.png")
showMIPs(c[:,:,:,1],filename=filenameImage,fignum=1)
filenameImage = Pkg.dir("OpenMPIData","data","reconstructions","$phantom","reconstruction$(phantom)2D_Slice.png")
showSlices(c[:,:,:,1],slice,filename=filenameImage,fignum=2)
=#
