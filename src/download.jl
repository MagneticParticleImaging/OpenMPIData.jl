using Requests

export downloadOpenMPIData

function downloadOpenMPIData()

mkpath(Pkg.dir("OpenMPIData","data","calibration"))
stream = get("http://media.tuhh.de/ibi/mdf/systemMatrix.h5")
save(stream, Pkg.dir("OpenMPIData","data","calibration","1.mdf"))

mkpath(Pkg.dir("OpenMPIData","data","measurement","dicePhantom"))
stream = get("http://media.tuhh.de/ibi/mdf/measurement_5.h5")
save(stream, Pkg.dir("OpenMPIData","data","measurement","dicePhantom","1.mdf"))

end
