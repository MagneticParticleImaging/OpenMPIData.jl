using PyPlot, MPIReco, OpenMPIData

include("visualization.jl")

filenameCalib = joinpath(OpenMPIData.basedir(),"data","calibrations","3.mdf")
#filenameCalib = joinpath(OpenMPIData.basedir(),"data","calibrations","6.mdf")#High Resolution

for (i,phantom) in enumerate(["shapePhantom", "resolutionPhantom", "concentrationPhantom"])

  filenameMeas = joinpath(OpenMPIData.basedir(),"data","measurements",phantom,"3.mdf")

  # reconstruct data
  c = reconstruction(filenameCalib, filenameMeas, iterations=3, lambd=0.001, bgCorrectionInternal=false,
                   minFreq=80e3, SNRThresh=2.0, recChannels=1:3, frames=1:1000, numAverages=1000, tfCorrectionInternal = false)

  mkpath( joinpath(OpenMPIData.basedir(),"data/reconstructions/$(phantom)"))
  s = size(c)[2:4]
  
  # visualization
  if phantom =="shapePhantom"
    filenameImage = joinpath(OpenMPIData.basedir(),"data","reconstructions","$phantom","reconstruction3D.png")
    showMIPs(c[1,:,:,:,1],filename=filenameImage,fignum=i)
  elseif phantom =="resolutionPhantom"
    slice=[div(s[1]+1,2),div(s[2]+1,2),div(s[3]+1,2)]
    filenameImage = joinpath(OpenMPIData.basedir(),"data","reconstructions","$phantom","reconstruction3D.png")
    showSlices(c[1,:,:,:,1],slice,filename=filenameImage, fignum=i)
  elseif phantom =="concentrationPhantom"
    slice1 = [div(s[1],3)+1,div(s[2],3)+1,div(s[3],3)+1]
    slice2 = [2*div(s[1],3)+1,2*div(s[2],3)+1,2*div(s[3],3)+1]
    filenameImage = joinpath(OpenMPIData.basedir(),"data","reconstructions","$phantom","reconstruction3D_1.png")
    showSlices(c[1,:,:,:,1],slice1,filename=filenameImage,fignum=i)
    filenameImage = joinpath(OpenMPIData.basedir(),"data","reconstructions","$phantom","reconstruction3D_2.png")
    showSlices(c[1,:,:,:,1],slice2,filename=filenameImage,fignum=i+1)
  end

end
