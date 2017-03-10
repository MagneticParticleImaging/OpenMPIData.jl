# Open MPI Data

Initiative for open Magnetic Particle Imaging Data

## Introduction

__This site is still under construction. Please do not use until this message is removed__

Magnetic particle imaging (MPI) is a tomograpic imaging technique that allows
to determine the spatial distribution of magnetic nanoparticles (MNPs). The aim
of this project is to provide MPI data that are openly available for the research
community and can be used for evaluating new reconstruction algorithms. We describe
the datasets, the used phantoms, and the applied measurement sequences in detail
so that the can be reproduced.

All MPI data is stored in the [MPI Data Format (MDF)](https://github.com/MagneticParticleImaging/MDF).
The MDF provides a common data format for the storage of MPI raw data, calibration data,
and reconstruction data.

This projects comes with a first set of datasets that should cover the most interesting
use cases. New datasets can be easily added and researcher wordwide are invited to 
contribute own datasets. 

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

## License / Usage

The source code of this project is licensed under the MIT license. All MPI data is licensed
under the [CC BY 4.0](https://creativecommons.org/licenses/by/4.0/) license. This implies that
you are free to use, share, and adapt the data. However, you must give appropriate credit. In
particular we ask you to cite the [MDF publication](http://arxiv.org/abs/1602.06072) and ... TODO

## Contribution

