# Installation and Usage

## Installation

The provided MPI data can be read from any programming language like Matlab, Python, Julia, and C.
On the [MDF website](https://github.com/MagneticParticleImaging/MDF) example scripts
for reading MDF data from Matlab, Python, and Julia are available.

This project uses the programming language Julia for data downloading and example reconstructions.
First you have to install [Julia](http://julialang.org/downloads/). Then open Julia and enter
```julia
Pkg.clone("https://github.com/MagneticParticleImaging/OpenMPIData.jl.git")
```
which will install the project. Then enter
```julia
using OpenMPIData
downloadOpenMPIData()
```
The first command will import the OpenMPIData package, the second command will download all MPI
data which can last several minutes up to hours depending on the speed of your internet connection.

TODO: example reconstructions

TODO
