# Calibration

When using a system matrix based reconstruction algorithm one
usually uses calibration data to setup the system matrix. In the
following we describe measured calibration datasets.

Each calibration dataset is acquired with a small sample of
a specific tracer representing an image voxel. The delta sample
is placed at various positions within the target FOV and calibration
measurements are taken.

Even for 1D and 2D sequences we measured the system matrix on a 3D grid.
While this is not strictly necessary for image reconstruction it can be
very usefull when studying the particle physics. It is advised to extract
appropriate slices prior to reconstruction.

All calibration datasets are also acquired outside the drive-field FOV.
This "overscanning" is essential to avoid particles from outside the
FOV influencing the reconstruction result inside the FOV. The overscan
may be manually shrinked prior to reconstruction


Tracer [Perimag](https://www.micromod.de/de/produkte-197-magnetisch_peri.html) (100 mmol), Delta Sample 2mm x 2mm x 1mm
Before each measurment a 30 minute Warm Up has been applied
# 1D Sequence

| Parameter                  |     Value                                |
| ---------------------------| ---------------------------------------- |
| Drive-Field Amplitude      |   12 mT x 0mT x 0 mT                     |
| Drive-Field Frequency      |   2.5 MHz/102 x 2.5 Mhz/96 x 2.5 Mhz/99  |
| Selection-Field Gradient   |   -1.0 T/m x -1.0 T/m x 2.0 T/m          |
| Sampled Field of View      |   24 mm x 24 mm x 12 mm                  |
| Grid size                   |   19  x 19  x 19                        |
| Repetition Time            |    40.8 $\mu$s                           |
| Number of Averages         |    1000                                  |
| Number of Background Scans |    362                                  |

# 2D Lissajous Sequence

| Parameter                  |     Value                                |
| ---------------------------| ---------------------------------------- |
| Drive-Field Amplitude      |   12 mT x 12 mT x 0 mT                   |
| Drive-Field Frequency      |   2.5 MHz/102 x 2.5 Mhz/96 x 2.5 Mhz/99  |
| Selection-Field Gradient   |   -1.0 T/m x -1.0 T/m x 2.0 T/m          |
| Sampled Field of View      |   24 mm x 24 mm x 12 mm                  |
| Grid size                   |   19  x 19  x 19                         |
| Repetition Time            |    652.8 $\mu$s                          |
| Number of Averages         |    1000                                  |
| Number of Background Scans |    362                                  |

# 3D Lissajous Sequence
| Parameter                  |     Value                                |
| ---------------------------| ---------------------------------------- |
| Drive-Field Amplitude      |   12 mT x 12 mT x 12 mT                  |
| Drive-Field Frequency      |   2.5 MHz/102 x 2.5 Mhz/96 x 2.5 Mhz/99  |
| Selection-Field Gradient   |   -1.0 T/m x -1.0 T/m x 2.0 T/m          |
| Sampled Field of View      |   24 mm x 24 mm x 12 mm                  |
| Grid size                   |   19  x 19  x 19                         |
| Repetition Time            |    21.54 ms                              |
| Number of Averages         |    1000                                  |
| Number of Background Scans |    362                                  |


## Transfer Function

Currently the transfer function of the receive chain is not included in the measured data.
However, we plan to include them in the datasets soon.

<!--  All datasets include the transfer function of the receive chain. One has
to divide the measured frequency data by this transfer function in order
to get corrected signals. This is in particular important when interpreting
time signals. -->
