using Requests

export downloadOpenMPIData

function downloadOpenMPIData()

mkpath(Pkg.dir("OpenMPIData","data","reconstructions"))
mkpath(Pkg.dir("OpenMPIData","data","calibrations"))
stream = get("http://media.tuhh.de/ibi/mdfv2/systemMatrix_V2.mdf")
save(stream, Pkg.dir("OpenMPIData","data","calibrations","1.mdf"))

mkpath(Pkg.dir("OpenMPIData","data","measurements","dicePhantom"))
stream = get("http://media.tuhh.de/ibi/mdfv2/measurement_V2.mdf")
save(stream, Pkg.dir("OpenMPIData","data","measurements","dicePhantom","1.mdf"))

end
