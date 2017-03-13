var documenterSearchIndex = {"docs": [

{
    "location": "index.html#",
    "page": "Home",
    "title": "Home",
    "category": "page",
    "text": ""
},

{
    "location": "index.html#Open-MPI-Data-1",
    "page": "Home",
    "title": "Open MPI Data",
    "category": "section",
    "text": "Initiative for open Magnetic Particle Imaging Data"
},

{
    "location": "index.html#Introduction-1",
    "page": "Home",
    "title": "Introduction",
    "category": "section",
    "text": "This site is still under construction. Please do not use until this message is removedMagnetic particle imaging (MPI) is a tomograpic imaging technique that allows to determine the spatial distribution of magnetic nanoparticles (MNPs). The aim of this project is to provide MPI data that are openly available for the research community and can be freely used. To facilate reproducable research all available information including a detailed description of the used pahntoms and the applied measurement sequences are provided.All MPI data is stored in the MPI Data Format (MDF). The MDF provides a common data format for the storage of MPI raw data, calibration data, and reconstruction data.This projects comes with a first set of datasets that covering the most interesting cases to get started with MPI. New datasets can be easily added and researcher wordwide  are invited to contribute own datasets. "
},

{
    "location": "index.html#License-/-Terms-of-Usage-1",
    "page": "Home",
    "title": "License / Terms of Usage",
    "category": "section",
    "text": "The source code of this project is licensed under the MIT license. All MPI data is licensed under the CC BY 4.0 license. This implies that you are free to use, share, and adapt the data. However, you must give appropriate credit. In particular we ask you to cite the MDF publication and ... TODO"
},

{
    "location": "index.html#Contribution-1",
    "page": "Home",
    "title": "Contribution",
    "category": "section",
    "text": "We invite you to contribute to this project and provide your own MPI data. Please open an issue to discuss how to add your data to the project."
},

{
    "location": "index.html#Contact-1",
    "page": "Home",
    "title": "Contact",
    "category": "section",
    "text": "If you have problems using the datasets, find mistakes, or have general questions please use the issue tracker to contact us. You can also contact Tobias Knopp directly."
},

{
    "location": "usage.html#",
    "page": "Usage",
    "title": "Usage",
    "category": "page",
    "text": ""
},

{
    "location": "usage.html#Installation-and-Usage-1",
    "page": "Usage",
    "title": "Installation and Usage",
    "category": "section",
    "text": ""
},

{
    "location": "usage.html#Installation-1",
    "page": "Usage",
    "title": "Installation",
    "category": "section",
    "text": "The provided MPI data can be read from any programming language like Matlab, Python, Julia, and C. On the MDF website example scripts for reading MDF data from Matlab, Python, and Julia are available.This project uses the programming language Julia for data downloading and example reconstructions. First you have to install Julia. Then open Julia and enterPkg.clone(\"https://github.com/MagneticParticleImaging/OpenMPIData.jl.git\")which will install the project. Then enterusing OpenMPIData\ndownloadOpenMPIData()The first command will import the OpenMPIData package, the second command will download all MPI data which can last several minutes up to hours depending on the speed of your internet connection.TODO: example reconstructionsTODO"
},

{
    "location": "datasets.html#",
    "page": "Datasets",
    "title": "Datasets",
    "category": "page",
    "text": ""
},

{
    "location": "datasets.html#Datasets-1",
    "page": "Datasets",
    "title": "Datasets",
    "category": "section",
    "text": "The datasets have been acquired with different scanners, tracers, measurements sequences and phantoms. To get an overview on all datasets you can download the following csv file:TODO same for calibrations"
},

{
    "location": "scanners.html#",
    "page": "Scanners",
    "title": "Scanners",
    "category": "page",
    "text": ""
},

{
    "location": "scanners.html#MPI-Scanners-1",
    "page": "Scanners",
    "title": "MPI Scanners",
    "category": "section",
    "text": "Here we describe the MPI scanners being used to acquire the MPI data"
},

{
    "location": "scanners.html#Bruker-Preclinical-MPI-Scanner-1",
    "page": "Scanners",
    "title": "Bruker Preclinical MPI Scanner",
    "category": "section",
    "text": "(Image: Bruker Preclinical MPI Scanner)The preclinical MPI scanner from Bruker has a 11.8 cm bore and is equipped with a fully 3D send/receive system and 3D focus fields allowing for flexible measurement sequencies. The system parameters are given belowParameter Value\nScanner Bore Diameter 11.8 mm\nMaxDrive-Field Amplitude 12 mT x 12 mT x 0 mT\nDrive-Field Frequency ??? x ??? x ???\nMax Selection-Field Gradient -1.0 T/m x -1.0 T/m x 2.0 T/m\nRepetition Time ??? ms"
},

{
    "location": "phantoms.html#",
    "page": "Phantoms",
    "title": "Phantoms",
    "category": "page",
    "text": ""
},

{
    "location": "phantoms.html#Phantoms-1",
    "page": "Phantoms",
    "title": "Phantoms",
    "category": "section",
    "text": "Here, we describe the phantoms being used during the MPI measurements."
},

{
    "location": "phantoms.html#Resolution-Phantom-1",
    "page": "Phantoms",
    "title": "Resolution Phantom",
    "category": "section",
    "text": "TODO"
},

{
    "location": "phantoms.html#Concentration-Phantom-1",
    "page": "Phantoms",
    "title": "Concentration Phantom",
    "category": "section",
    "text": "TODO"
},

{
    "location": "phantoms.html#Dynamic-Phantom-1",
    "page": "Phantoms",
    "title": "Dynamic Phantom",
    "category": "section",
    "text": "TODO"
},

{
    "location": "tracers.html#",
    "page": "Tracers",
    "title": "Tracers",
    "category": "page",
    "text": ""
},

{
    "location": "tracers.html#Tracers-1",
    "page": "Tracers",
    "title": "Tracers",
    "category": "section",
    "text": "Here we describe the tracers that have been used for the measurements"
},

{
    "location": "tracers.html#Resovist-1",
    "page": "Tracers",
    "title": "Resovist",
    "category": "section",
    "text": "TODO"
},

{
    "location": "sequences.html#",
    "page": "Sequences",
    "title": "Sequences",
    "category": "page",
    "text": ""
},

{
    "location": "sequences.html#Sequences-1",
    "page": "Sequences",
    "title": "Sequences",
    "category": "section",
    "text": "Several MPI measurement sequences have been used for data acquisition. All parameters are described in the following"
},

{
    "location": "sequences.html#D-Lissajous-Sequence-1",
    "page": "Sequences",
    "title": "2D Lissajous Sequence",
    "category": "section",
    "text": "Parameter Value\nDrive-Field Amplitude 12 mT x 12 mT x 0 mT\nDrive-Field Frequency 2.5 MHz/102 x 2.5 Mhz/96 x 2.5 Mhz/99\nSelection-Field Gradient -1.0 T/m x -1.0 T/m x 2.0 T/m\nRepetition Time ??? ms\nNumber of Frames 1000"
},

{
    "location": "sequences.html#D-Cartesian-Sequence-1",
    "page": "Sequences",
    "title": "2D Cartesian Sequence",
    "category": "section",
    "text": "Parameter Value\nDrive-Field Amplitude 12 mT x 0 mT x 0 mT\nDrive-Field Frequency 2.5 MHz/102 x 2.5 Mhz/96 x 2.5 Mhz/99\nSelection-Field Gradient -1.0 T/m x -1.0 T/m x 2.0 T/m\nRepetition Time 40.8 mus\nNumber of Frames 1000"
},

{
    "location": "sequences.html#D-Lissajous-Sequence-2",
    "page": "Sequences",
    "title": "3D Lissajous Sequence",
    "category": "section",
    "text": ""
},

{
    "location": "sequences.html#Dt-Lissajous-Sequence-1",
    "page": "Sequences",
    "title": "3D+t Lissajous Sequence",
    "category": "section",
    "text": ""
},

{
    "location": "calibration.html#",
    "page": "Calibration",
    "title": "Calibration",
    "category": "page",
    "text": ""
},

{
    "location": "calibration.html#Calibration-1",
    "page": "Calibration",
    "title": "Calibration",
    "category": "section",
    "text": "When using a system matrix based reconstruction algorithm one usually uses calibration data to setup the system matrix. In the  following we describe measured calibration datasets.Each calibration dataset is acquired with a small sample of a specific tracer representing an image voxel. The delta sample is placed at various positions within the target FOV and calibration measurements are taken.Even for 1D and 2D sequences we measured the system matrix on a 3D grid. While this is not strictly necessary for image reconstruction it can be very usefull when studying the particle physics. It is advised to extract appropriate slices prior to reconstruction.All calibration datasets are also acquired outside the drive-field FOV. This \"overscanning\" is essential to avoid particles from outside the FOV influencing the reconstruction result inside the FOV. The overscan may be manually shrinked prior to reconstruction"
},

{
    "location": "calibration.html#Transfer-Function-1",
    "page": "Calibration",
    "title": "Transfer Function",
    "category": "section",
    "text": "All datasets include the tranfer function of the receive chain. One has to divide the measured frequency data by this transfer function in order to get corrected signals. This is in particular important when interpreting time signals."
},

]}
