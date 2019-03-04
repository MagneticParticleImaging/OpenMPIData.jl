using Pkg, HTTP

export downloadOpenMPIData, downloadCalibrationDataHighRes, downloadCalibrationDataLowRes,
       download2DData, download3DData

function makeFolders()
  mkpath(Pkg.dir("OpenMPIData","data","reconstructions"))
  mkpath(Pkg.dir("OpenMPIData","data","calibrations"))
  mkpath(Pkg.dir("OpenMPIData","data","measurements","resolutionPhantom"))
  mkpath(Pkg.dir("OpenMPIData","data","measurements","shapePhantom"))
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
           "data/measurements/shapePhantom/1.mdf",
           "data/measurements/concentrationPhantom/1.mdf"]

  for file in files
    HTTP.open("GET", "http://media.tuhh.de/ibi/openMPIData/"*file) do http
      open(Pkg.dir("OpenMPIData",file), "w") do file
        write(file, http)
      end
    end
  end
end
function download2DData()
  makeFolders()

  files = ["data/measurements/resolutionPhantom/2.mdf",
           "data/measurements/shapePhantom/2.mdf",
           "data/measurements/concentrationPhantom/2.mdf"]

  for file in files
    HTTP.open("GET", "http://media.tuhh.de/ibi/openMPIData/"*file) do http
      open(Pkg.dir("OpenMPIData",file), "w") do file
        write(file, http)
      end
    end
  end
end

function download3DData()
  makeFolders()
  files = ["data/measurements/resolutionPhantom/3.mdf",
           "data/measurements/shapePhantom/3.mdf",
           "data/measurements/concentrationPhantom/3.mdf"]

  for file in files
    HTTP.open("GET", "http://media.tuhh.de/ibi/openMPIData/"*file) do http
      open(Pkg.dir("OpenMPIData",file), "w") do file
        write(file, http)
      end
    end
  end
end

function downloadCalibrationDataLowRes()
  makeFolders()

  files = ["data/calibrations/1.mdf",
           "data/calibrations/2.mdf",
           "data/calibrations/3.mdf",]

  for file in files
    HTTP.open("GET", "http://media.tuhh.de/ibi/openMPIData/"*file) do http
      open(Pkg.dir("OpenMPIData",file), "w") do file
        write(file, http)
      end
    end
  end
end

function downloadCalibrationDataHighRes()
  makeFolders()

  files = ["data/calibrations/4.mdf",
           "data/calibrations/5.mdf",
           "data/calibrations/6.mdf",]

  for file in files
    HTTP.open("GET", "http://media.tuhh.de/ibi/openMPIData/"*file) do http
      open(Pkg.dir("OpenMPIData",file), "w") do file
        write(file, http)
      end
    end
  end
end
