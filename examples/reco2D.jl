using CairoMakie, MPIReco, OpenMPIData

include("visualization.jl")

filenameCalib = joinpath(OpenMPIData.basedir(),"data","calibrations","2.mdf")
#filenameCalib = joinpath(OpenMPIData.basedir(),"data","calibrations","5.mdf")
calib = MPIFile(filenameCalib)

for (i,phantom) in enumerate(["shapePhantom", "resolutionPhantom", "concentrationPhantom"])

  filenameMeas = joinpath(OpenMPIData.basedir(),"data","measurements",phantom,"2.mdf")
  meas = MPIFile(filenameMeas)

  # reconstruct data
  c = reconstruct("SinglePatch", meas; sf = calib, iterations=10, reg= [L2Regularization(0.01)], solver = Kaczmarz,
                    minFreq=80e3, SNRThresh=1.5, recChannels=1:3,
		    bgCorrectionInternal=true, spectralLeakageCorrection=false)[:,:,:,10:28,:]

  mkpath( joinpath(OpenMPIData.basedir(),"data/reconstructions/$(phantom)"))
  s = size(c)[2:4]
  
  # visualization  
  if phantom =="shapePhantom"
    filenameImage = joinpath(OpenMPIData.basedir(),"data","reconstructions","$phantom","reconstruction2D.png")
    showMIPs(c[1,:,:,:,1],filename=filenameImage)
  elseif phantom =="resolutionPhantom"
    slice=[div(s[1]+1,2),div(s[2]+1,2),div(s[3]+1,2)]
    filenameImage = joinpath(OpenMPIData.basedir(),"data","reconstructions","$phantom","reconstruction2D.png")
    showSlices(c[1,:,:,:,1],slice,filename=filenameImage)
  elseif phantom =="concentrationPhantom"
    slice1=[div(s[1],3)+1,div(s[2],3)+1,div(s[3],3)+1]
    slice2=[2*div(s[1],3)+1,2*div(s[2],3)+1,div(s[3],3)+1]
    filenameImage = joinpath(OpenMPIData.basedir(),"data","reconstructions","$phantom","reconstruction2D_1.png")
    showSlices(c[1,:,:,:,1],slice1,filename=filenameImage)
    filenameImage = joinpath(OpenMPIData.basedir(),"data","reconstructions","$phantom","reconstruction2D_2.png")
    showSlices(c[1,:,:,:,1],slice2,filename=filenameImage)
  end
end
