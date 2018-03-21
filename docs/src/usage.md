# Installation and Usage

## Installation

The provided MPI data can be read from any programming language like Matlab, Python, Julia, and C.
On the [MDF website](https://github.com/MagneticParticleImaging/MDF) example scripts
for reading MDF data from Matlab, Python, and Julia are available.

All data can be found under the following [link](https://media.tuhh.de/ibi/openMPIData/data/). To simplify the data download and to provide example reconstructions this project also contains dedicated programming tools. These tools are written in the scientific programming language Julia and can be freely used. They are not strictly necessary if you want to use your own reconstruction methods.

In order to install the programming tools you first have to install [Julia](http://julialang.org/downloads/) in version 0.6. Then open Julia and enter
```julia
Pkg.clone("https://github.com/MagneticParticleImaging/OpenMPIData.jl.git")
```
which will install the package. Then enter
```julia
using OpenMPIData
downloadOpenMPIData()
```
The first command will import the OpenMPIData package, the second command will download all MPI
data which can last several minutes up to hours depending on the speed of your internet connection.

The `downloadOpenMPIData()` function will not download some of the open MPI data. The high resolution MPI system functions need to be manually downloaded using the command
```julia
downloadCalibrationDataHighRes()
```
To download the datasets for 1D, 2D, 3D or the system functions respectivly, use:
```julia
 download1DData()
 download2DData()
 download3DData()
 downloadCalibrationDataLowRes()
 downloadCalibrationDataHighRes()
```

## Example Reconstruction

Once the data is downloaded one can execute one of the example reconstruction scripts
```julia
include(Pkg.dir("OpenMPIData","examples/reco3D.jl"))
```
The content of this script is given below
```julia
using OpenMPIData

filenameCalib = Pkg.dir("OpenMPIData","data","calibrations","3.mdf")
#filenameCalib = Pkg.dir("OpenMPIData","data","calibrations","6.mdf")#High Resolution

### Shape Phantom
# phantom = "shapePhantom"
### Resolution Phantom
# phantom = "resolutionPhantom"
### Concentration Phantom
 phantom = "concentrationPhantom"

filenameMeas = Pkg.dir("OpenMPIData","data","measurements",phantom,"3.mdf")

c = reconstruction(filenameCalib, filenameMeas, iterations=3, lambda=0.001,
                   minFreq=80e3, SNRThresh=2.0, recChannels=1:3)
mkpath("../docs/src/reconstructions/$phantom/")
s=size(c)
if phantom =="shapePhantom"
  filenameImage = Pkg.dir("OpenMPIData","docs","src","reconstructions","$phantom","reconstruction3D.png")
  showMIPs(c[:,:,:,1],filename=filenameImage)
elseif phantom =="resolutionPhantom"
  slice=[div(s[1]+1,2),div(s[2]+1,2),div(s[3]+1,2)]
  filenameImage = Pkg.dir("OpenMPIData","docs","src","reconstructions","$phantom","reconstruction3D.png")
  showSlices(c[:,:,:,1],slice,filename=filenameImage)
elseif phantom =="concentrationPhantom"
  slice1=[div(s[1],3)+1,div(s[2],3)+1,div(s[3],3)+1]
  slice2=[2*div(s[1],3)+1,2*div(s[2],3)+1,2*div(s[3],3)+1]
  filenameImage = Pkg.dir("OpenMPIData","docs","src","reconstructions","$phantom","reconstruction3D_1.png")
  showSlices(c[:,:,:,1],slice1,filename=filenameImage,fignum=1)
  filenameImage = Pkg.dir("OpenMPIData","docs","src","reconstructions","$phantom","reconstruction3D_2.png")
  showSlices(c[:,:,:,1],slice2,filename=filenameImage,fignum=2)
end
```

Within the script one can chose different datasets by changing the `phantom` string. The OpenMPIData package contains a small reconstruction library that uses [MPIFiles.jl](https://github.com/MagneticParticleImaging/MPIFiles.jl) for handling of MDF files.
To reconstruct the 1D or the 2D dataset use 
```julia
include(Pkg.dir("OpenMPIData","examples/reco1D.jl"))
```
or 
```julia
include(Pkg.dir("OpenMPIData","examples/reco2D.jl"))
```
The 1D and 2D reconstructions are performed patchwise and stiched to 3D-Volume afterwards.
