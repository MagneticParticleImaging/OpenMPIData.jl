using Requests

export downloadOpenMPIData, downloadCalibrationDataHighRes, downloadCalibrationDataLowRes,
       download2DData, download3DData

function makeFolders()
  mkpath(Pkg.dir("OpenMPIData","data","reconstructions"))
  mkpath(Pkg.dir("OpenMPIData","data","calibrations"))
  mkpath(Pkg.dir("OpenMPIData","data","measurements","resolutionPhantom"))
  mkpath(Pkg.dir("OpenMPIData","data","measurements","conePhantom"))
  mkpath(Pkg.dir("OpenMPIData","data","measurements","concentrationPhantom"))
end

function downloadOpenMPIData()
  download1DData()
  download2DData()
  download3DData()
  downloadCalibrationDataLowRes()
  #downloadCalibrationDataHighRes()  # This should be done explicitely
end

function download1DData()
  makeFolders()

  files = ["data/measurements/resolutionPhantom/1.mdf",
           "data/measurements/conePhantom/1.mdf",
           "data/measurements/concentrationPhantom/1.mdf"]

  for file in files
    stream = get("http://media.tuhh.de/ibi/openMPIData/"*file)
    save(stream, Pkg.dir("OpenMPIData",file))
  end
end
function download2DData()
  makeFolders()

  files = ["data/measurements/resolutionPhantom/2.mdf",
           "data/measurements/conePhantom/2.mdf",
           "data/measurements/concentrationPhantom/2.mdf"]

  for file in files
    stream = get("http://media.tuhh.de/ibi/openMPIData/"*file)
    save(stream, Pkg.dir("OpenMPIData",file))
  end
end

function download3DData()
  makeFolders()
  files = ["data/measurements/resolutionPhantom/3.mdf",
           "data/measurements/conePhantom/3.mdf",
           "data/measurements/concentrationPhantom/3.mdf"]

  for file in files
    stream = get("http://media.tuhh.de/ibi/openMPIData/"*file)
    save(stream, Pkg.dir("OpenMPIData",file))
  end
end

function downloadCalibrationDataLowRes()
  makeFolders()

  files = ["data/calibrations/1.mdf",
           "data/calibrations/2.mdf",
           "data/calibrations/3.mdf",]

  for file in files
    stream = get("http://media.tuhh.de/ibi/openMPIData/"*file)
    save(stream, Pkg.dir("OpenMPIData",file))
  end
end

function downloadCalibrationDataHighRes()
  makeFolders()

  files = ["data/calibrations/4.mdf",
           "data/calibrations/5.mdf",
           "data/calibrations/6.mdf",]

  for file in files
    stream = get("http://media.tuhh.de/ibi/openMPIData/"*file)
    save(stream, Pkg.dir("OpenMPIData",file))
  end
end
