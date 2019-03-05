# Installation and Usage

## Installation

The provided MPI data can be read from any programming language like Matlab, Python, Julia, and C.
On the [MDF website](https://github.com/MagneticParticleImaging/MDF) example scripts
for reading MDF data from Matlab, Python, and Julia are available.

All data can be found under the following [link](https://media.tuhh.de/ibi/openMPIData/data/). To simplify the data download and to provide example reconstructions this project also contains dedicated programming tools. These tools are written in the scientific programming language Julia and can be freely used. They are not strictly necessary if you want to use your own reconstruction methods.

In order to install the programming tools you first have to install [Julia](http://julialang.org/downloads/) in version 1.1 or newer. Then open Julia and enter
```julia
using Pkg
Pkg.add(PackageSpec(url="https://github.com/MagneticParticleImaging/OpenMPIData.jl.git"))
```
which will install the package. Then enter
```julia
using OpenMPIData
downloadOpenMPIData()
```
The first command will import the OpenMPIData package, the second command will download all MPI
data which can last several minutes up to hours depending on the speed of your internet connection.

The `downloadOpenMPIData()` function will not download all of the open MPI data. The high resolution MPI system functions need to be manually downloaded using the command
```julia
downloadCalibrationDataHighRes()
```
To download the datasets for 1D, 2D, 3D or the system functions individually, use:
```julia
 download1DData()
 download2DData()
 download3DData()
 downloadCalibrationDataLowRes()
 downloadCalibrationDataHighRes()
```

## Example Reconstruction

Once the data is downloaded one can execute one of the example reconstruction scripts. To this end first the reconstruction package [MPIReco.jl](https://github.com/MagneticParticleImaging/MPIReco.jl) needs to be installed:
```julia
using Pkg
Pkg.add(PackageSpec(url="https://github.com/MagneticParticleImaging/OpenMPIData.jl.git"))
```
Then, the reconstruction script for the 3D excitation can be run by calling
```julia
using OpenMPIData
include(joinpath(OpenMPIData.basedir(), "examples/reco3D.jl"))
```
The content of this script is given below
```julia
using PyPlot, MPIReco, OpenMPIData

include("visualization.jl")

filenameCalib = joinpath(OpenMPIData.basedir(),"data","calibrations","1.mdf")
#filenameCalib = joinpath(OpenMPIData.basedir(),"data","calibrations","4.mdf")

for (i,phantom) in enumerate(["shapePhantom", "resolutionPhantom", "concentrationPhantom"])

  filenameMeas = joinpath(OpenMPIData.basedir(),"data","measurements",phantom,"1.mdf")

  # reconstruct data
  c = reconstruction(filenameCalib, filenameMeas, iterations=10, lambd=0.1,
                    minFreq=80e3, SNRThresh=5.0, recChannels=1:3,
		    bgCorrectionInternal=true)[:,:,:,9:27,:]

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
```
Within the script all three datasets are reconstructed and visualized using `PyPlot`. 
To reconstruct the 1D or the 2D dataset use
```julia
include(joinpath(OpenMPIData.basedir(), "examples/reco1D.jl"))
```
or
```julia
include(joinpath(OpenMPIData.basedir(), "examples/reco2D.jl"))
```
