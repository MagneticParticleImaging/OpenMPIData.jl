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

## Transfer Function

All datasets include the tranfer function of the receive chain. One has
to divide the measured frequency data by this transfer function in order
to get corrected signals. This is in particular important when interpreting
time signals.


