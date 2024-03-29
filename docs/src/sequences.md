# Sequences

Several MPI measurement sequences have been used for data
acquisition. The sequence parameters are listed below.

# 1D Sequence

| Parameter                  |     Value                                |
| ---------------------------| ---------------------------------------- |
| Drive-Field Amplitude      |   12 mT x 0 mT x 0 mT                   |
| Drive-Field Frequency      |   2.5 MHz/102 x 2.5 Mhz/96 x 2.5 Mhz/99  |
| Selection-Field Gradient   |   -1.0 T/m x -1.0 T/m x 2.0 T/m          |
| Repetition Time            |    40.8 $\mu$s                          |
| Number of Patches             |    19 x 19                      |
| Number of Periods per Patches             |    1000                    |
| Number of Frames           |    1                                  |

During the measurement of the 1D sequence the phantom was moved step-wise in the y-dimension and z-dimension with the robot. The movement was performed first in the z-dimension and then in the y-dimension. Each patch represents one robot position, in total 19x19=361 1D patches/positions.


# 2D Lissajous Sequence

| Parameter                  |     Value                                |
| ---------------------------| ---------------------------------------- |
| Drive-Field Amplitude      |   12 mT x 12 mT x 0 mT                   |
| Drive-Field Frequency      |   2.5 MHz/102 x 2.5 Mhz/96 x 2.5 Mhz/99  |
| Selection-Field Gradient   |   -1.0 T/m x -1.0 T/m x 2.0 T/m          |
| Repetition Time            |    652.8 $\mu$s                          |
| Number of Patches             |    19                        |
| Number of Periods per Patches             |    1000                    |
| Number of Frames           |    1                                  |


During the measurement of the 2D sequence the phantom was moved step-wise in z-dimension with the robot. Each patch represents one robot position, in total 19 2D patches/positions.

# 3D Lissajous Sequence
| Parameter                  |     Value                                |
| ---------------------------| ---------------------------------------- |
| Drive-Field Amplitude      |   12 mT x 12 mT x 12 mT                  |
| Drive-Field Frequency      |   2.5 MHz/102 x 2.5 Mhz/96 x 2.5 Mhz/99  |
| Selection-Field Gradient   |   -1.0 T/m x -1.0 T/m x 2.0 T/m          |
| Repetition Time            |    21.54 ms                              |
| Number of Frames           |    1000                                  |
