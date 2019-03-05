using PyPlot, MPIReco, OpenMPIData

include("visualization.jl")

filenameCalib = joinpath(OpenMPIData.basedir(),"data","calibrations","3.mdf")
#filenameCalib = joinpath(OpenMPIData.basedir(),"data","calibrations","6.mdf")#High Resolution

### Shape Phantom
# phantom = "shapePhantom"
### Resolution Phantom
# phantom = "resolutionPhantom"
### Concentration Phantom
 phantom = "concentrationPhantom"

filenameMeas = joinpath(OpenMPIData.basedir(),"data","measurements",phantom,"3.mdf")


c = reconstruction(filenameCalib, filenameMeas, iterations=3, lambd=0.001, bgCorrectionInternal=false,
                   minFreq=80e3, SNRThresh=2.0, recChannels=1:3, frames=1:1000, nAverages=1000)

mkpath( joinpath(OpenMPIData.basedir(),"data/reconstructions/$(phantom)"))
s=size(c)[2:4]
if phantom =="shapePhantom"
  filenameImage = joinpath(OpenMPIData.basedir(),"data","reconstructions","$phantom","reconstruction3D.png")
  showMIPs(c[1,:,:,:,1],filename=filenameImage)
elseif phantom =="resolutionPhantom"
  slice=[div(s[1]+1,2),div(s[2]+1,2),div(s[3]+1,2)]
  filenameImage = joinpath(OpenMPIData.basedir(),"data","reconstructions","$phantom","reconstruction3D.png")
  showSlices(c[1,:,:,:,1],slice,filename=filenameImage)
elseif phantom =="concentrationPhantom"
  slice1=[div(s[1],3)+1,div(s[2],3)+1,div(s[3],3)+1]
  slice2=[2*div(s[1],3)+1,2*div(s[2],3)+1,2*div(s[3],3)+1]
  filenameImage = joinpath(OpenMPIData.basedir(),"data","reconstructions","$phantom","reconstruction3D_1.png")
  showSlices(c[1,:,:,:,1],slice1,filename=filenameImage,fignum=1)
  filenameImage = joinpath(OpenMPIData.basedir(),"data","reconstructions","$phantom","reconstruction3D_2.png")
  showSlices(c[1,:,:,:,1],slice2,filename=filenameImage,fignum=2)
end
