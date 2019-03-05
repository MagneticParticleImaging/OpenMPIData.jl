using PyPlot, MPIReco, OpenMPIData

include("visualization.jl")

filenameCalib = joinpath(OpenMPIData.basedir(),"data","calibrations","1.mdf")
#filenameCalib = joinpath(OpenMPIData.basedir(),"data","calibrations","4.mdf")

for (i,phantom) in enumerate(["shapePhantom", "resolutionPhantom", "concentrationPhantom"])

  filenameMeas = joinpath(OpenMPIData.basedir(),"data","measurements",phantom,"1.mdf")

  # reconstruct data
  c = reconstruction(filenameCalib, filenameMeas, iterations=1, lambd=0.1,
                    minFreq=80e3, SNRThresh=5.0, recChannels=1:3,
		    bgCorrectionInternal=true)[:,:,9:27,9:27,:]

  mkpath( joinpath(OpenMPIData.basedir(),"data/reconstructions/$(phantom)"))
  s = size(c)[2:4]
  
  # visualization  
  if phantom =="shapePhantom"
    filenameImage = joinpath(OpenMPIData.basedir(),"data","reconstructions","$phantom","reconstruction1D.png")
    showMIPs(c[1,:,:,:,1],filename=filenameImage, fignum=i)
  elseif phantom =="resolutionPhantom"
    slice=[div(s[1]+1,2),div(s[2]+1,2),div(s[3]+1,2)]
    filenameImage = joinpath(OpenMPIData.basedir(),"data","reconstructions","$phantom","reconstruction1D.png")
    showSlices(c[1,:,:,:,1],slice,filename=filenameImage, fignum=i)
  elseif phantom =="concentrationPhantom"
    slice1=[div(s[1],3)+1,div(s[2],3)+1,div(s[3],3)+1]
    slice2=[2*div(s[1],3)+1,2*div(s[2],3)+1,div(s[3],3)+1]
    filenameImage = joinpath(OpenMPIData.basedir(),"data","reconstructions","$phantom","reconstruction1D_1.png")
    showSlices(c[1,:,:,:,1],slice1,filename=filenameImage,fignum=i)
    filenameImage = joinpath(OpenMPIData.basedir(),"data","reconstructions","$phantom","reconstruction1D_2.png")
    showSlices(c[1,:,:,:,1],slice2,filename=filenameImage,fignum=i+1)
  end
end


