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
    "text": "The phantoms have been acquired with specific measurement sequences, MPI scanners, and tracer material.  In the following table an overview about all datasets is given:"
},

{
    "location": "datasets.html#Phantom-Measurements-1",
    "page": "Datasets",
    "title": "Phantom Measurements",
    "category": "section",
    "text": "Study Experiment Number Scanner Sequence Tracer\nresolutionPhantom 1 Bruker 1D Cartesian Perimag\nresolutionPhantom 2 Bruker 2D Lissajous Perimag\nresolutionPhantom 3 Bruker 3D Lissajous Perimag\nconePhantom 1 Bruker 1D Cartesian Perimag\nconePhantom 2 Bruker 2D Lissajous Perimag\nconePhantom 3 Bruker 3D Lissajous Perimag\nconcentrationPhantom 1 Bruker 1D Cartesian Perimag\nconcentrationPhantom 2 Bruker 2D Lissajous Perimag\nconcentrationPhantom 3 Bruker 3D Lissajous PerimagIn addition several calibration measurements are available:"
},

{
    "location": "datasets.html#Calibration-Measurements-1",
    "page": "Datasets",
    "title": "Calibration Measurements",
    "category": "section",
    "text": "Study Experiment Number Scanner Sequence Tracer\ncalibration 1 Bruker 1D Cartesian Perimag\ncalibration 2 Bruker 2D Lissajous Perimag\ncalibration 3 Bruker 3D Lissajous Perimag"
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
    "text": "(Image: Bruker Preclinical MPI Scanner)The preclinical MPI scanner from Bruker has a 11.8 cm bore and is equipped with a fully 3D send/receive system and 3D focus fields allowing for flexible measurement sequencies. The system parameters are given belowParameter Value\nScanner Bore Diameter 11.8 mm\nMaxDrive-Field Amplitude 14 mT x 14 mT x 14 mT\nMaxFocus-Field Amplitude 17 mT x 17 mT x 42 mT\nDrive-Field Frequency 2.5MHz/102 x 2.5MHz/96 x 2.5MHz/99\nMax Selection-Field Gradient -1.25 T/m x -1.25 T/m x 2.5 T/m\nRepetition Time 38.4 mus - 21.54 ms"
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
    "text": "The resolution phantom consits of 5 tubes filled with Perimag featuring a concentration of 50 mmol. The 5 tubes have a common origin on one side of the phantom. From there the extend in different angles from this origin within the XY and the YZ plane. As the imaging system features the strong gradient in Z direction the angles in the YZ plane are chosen smaller () than in XY direction (). By chosing different planes, one can determine the capable resolution due to different distances of the tubes.(Image: Resolution Phantom)(Image: Resolution Phantom)"
},

{
    "location": "phantoms.html#Concentration-Phantom-1",
    "page": "Phantoms",
    "title": "Concentration Phantom",
    "category": "section",
    "text": "The second phantom consists of 8 cubes of 2mm edge length resulting in 8µl volume each. The distance of the cubes are 12 mm between centers (10 mm between edges)  within the XY plane and 6 between centers (4 mm between corners) within Z direction. We name the sample chambers 1 to 8 starting with the top layer on the front left (positive X and Y direction), counting clockwise. Then starting with the lower layer with number 5 on the front left (positive X and Y direction), counting clockwise. The concentrations in the 8 sample chambers are the following:Num. Concentration\n1 100 mmol/l\n2 66.6 mmol/l\n3 44.4 mmol/l\n4 29.6 mmol/l\n5 19.7 mmol/l\n6 13.1 mmol/l\n7 8.77 mmol/l\n8 5.85 mmol/l(Image: ConcentrationPhantom)(Image: ConcentrationPhantom)"
},

{
    "location": "phantoms.html#Shape-Phantom-1",
    "page": "Phantoms",
    "title": "Shape Phantom",
    "category": "section",
    "text": "To resemble a well known shape a cone defined by a 1 mm radius tip and an apex angle of 10 deg and a hight of 22 mm. The total volume is 683.9 µL. As tracer Perimag in a concentration of 50 mmol/L were used. The phantom can be rendered in 3D resemling the cone or can be cut in a layer view to see either a circle (YZ plane) or a triangle with flattened tip (XZ or XY plane)(Image: ShapePhantom)(Image: ShapePhantom)"
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
    "location": "tracers.html#Perimag-1",
    "page": "Tracers",
    "title": "Perimag",
    "category": "section",
    "text": "micromod: perimag<!– comment –>"
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
    "text": "Several MPI measurement sequences have been used for data acquisition. The sequence parameters are listed below."
},

{
    "location": "sequences.html#D-Sequence-1",
    "page": "Sequences",
    "title": "1D Sequence",
    "category": "section",
    "text": "Parameter Value\nDrive-Field Amplitude 12 mT x 0 mT x 0 mT\nDrive-Field Frequency 2.5 MHz/102 x 2.5 Mhz/96 x 2.5 Mhz/99\nSelection-Field Gradient -1.0 T/m x -1.0 T/m x 2.0 T/m\nRepetition Time 652.8 mus\nNumber of Patches 19 x 19\nNumber of Periods per Patches 1000\nNumber of Frames 1"
},

{
    "location": "sequences.html#D-Lissajous-Sequence-1",
    "page": "Sequences",
    "title": "2D Lissajous Sequence",
    "category": "section",
    "text": "Parameter Value\nDrive-Field Amplitude 12 mT x 12 mT x 0 mT\nDrive-Field Frequency 2.5 MHz/102 x 2.5 Mhz/96 x 2.5 Mhz/99\nSelection-Field Gradient -1.0 T/m x -1.0 T/m x 2.0 T/m\nRepetition Time 652.8 mus\nNumber of Patches 19\nNumber of Periods per Patches 1000\nNumber of Frames 1"
},

{
    "location": "sequences.html#D-Lissajous-Sequence-2",
    "page": "Sequences",
    "title": "3D Lissajous Sequence",
    "category": "section",
    "text": "Parameter Value\nDrive-Field Amplitude 12 mT x 12 mT x 12 mT\nDrive-Field Frequency 2.5 MHz/102 x 2.5 Mhz/96 x 2.5 Mhz/99\nSelection-Field Gradient -1.0 T/m x -1.0 T/m x 2.0 T/m\nRepetition Time 21.54 ms\nNumber of Frames 1000"
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
    "text": "When using a system matrix based reconstruction algorithm one usually uses calibration data to setup the system matrix. In the following we describe measured calibration datasets.Each calibration dataset is acquired with a small sample of a specific tracer representing an image voxel. The delta sample is placed at various positions within the target FOV and calibration measurements are taken.Even for 1D and 2D sequences we measured the system matrix on a 3D grid. While this is not strictly necessary for image reconstruction it can be very usefull when studying the particle physics. It is advised to extract appropriate slices prior to reconstruction.All calibration datasets are also acquired outside the drive-field FOV. This \"overscanning\" is essential to avoid particles from outside the FOV influencing the reconstruction result inside the FOV. The overscan may be manually shrinked prior to reconstructionTracer Resovist (250 mmol), Delta Sample 2mm x 2mm x 1mm Before each measurment a 30 minute Warm Up has been applied"
},

{
    "location": "calibration.html#D-Sequence-1",
    "page": "Calibration",
    "title": "1D Sequence",
    "category": "section",
    "text": "Parameter Value\nDrive-Field Amplitude 12 mT x 0mT x 0 mT\nDrive-Field Frequency 2.5 MHz/102 x 2.5 Mhz/96 x 2.5 Mhz/99\nSelection-Field Gradient -1.0 T/m x -1.0 T/m x 2.0 T/m\nSampled Field of View 24 mm x 24 mm x 12 mm\nGrid size 19  x 19  x 19\nRepetition Time 40.8 mus\nNumber of Averages 1000\nNumber of Background Scans 362"
},

{
    "location": "calibration.html#D-Lissajous-Sequence-1",
    "page": "Calibration",
    "title": "2D Lissajous Sequence",
    "category": "section",
    "text": "Parameter Value\nDrive-Field Amplitude 12 mT x 12 mT x 0 mT\nDrive-Field Frequency 2.5 MHz/102 x 2.5 Mhz/96 x 2.5 Mhz/99\nSelection-Field Gradient -1.0 T/m x -1.0 T/m x 2.0 T/m\nSampled Field of View 24 mm x 24 mm x 12 mm\nGrid size 19  x 19  x 19\nRepetition Time 652.8 mus\nNumber of Averages 1000\nNumber of Background Scans 362"
},

{
    "location": "calibration.html#D-Lissajous-Sequence-2",
    "page": "Calibration",
    "title": "3D Lissajous Sequence",
    "category": "section",
    "text": "Parameter Value\nDrive-Field Amplitude 12 mT x 12 mT x 12 mT\nDrive-Field Frequency 2.5 MHz/102 x 2.5 Mhz/96 x 2.5 Mhz/99\nSelection-Field Gradient -1.0 T/m x -1.0 T/m x 2.0 T/m\nSampled Field of View 24 mm x 24 mm x 12 mm\nGrid size 19  x 19  x 19\nRepetition Time 21.54 ms\nNumber of Averages 1000\nNumber of Background Scans 362"
},

{
    "location": "calibration.html#Transfer-Function-1",
    "page": "Calibration",
    "title": "Transfer Function",
    "category": "section",
    "text": "Currently the transfer function of the receive chain is not included in the measured data. However, we plan to include them in the datasets soon.<!–  All datasets include the transfer function of the receive chain. One has to divide the measured frequency data by this transfer function in order to get corrected signals. This is in particular important when interpreting time signals. –>"
},

]}