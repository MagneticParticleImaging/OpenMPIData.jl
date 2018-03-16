using Requests

export downloadOpenMPIData

function downloadOpenMPIData()

  mkpath(Pkg.dir("OpenMPIData","data","reconstructions"))
  mkpath(Pkg.dir("OpenMPIData","data","calibrations"))
  mkpath(Pkg.dir("OpenMPIData","data","measurements","resolutionPhantom"))
  mkpath(Pkg.dir("OpenMPIData","data","measurements","conePhantom"))
  mkpath(Pkg.dir("OpenMPIData","data","measurements","concentrationPhantom"))

  files = [#"data/calibrations/1.mdf",
           #"data/calibrations/2.mdf",
           "data/calibrations/3.mdf",
           "data/measurements/resolutionPhantom/3.mdf",
           "data/measurements/conePhantom/3.mdf"]

  for file in files
    stream = get("http://media.tuhh.de/ibi/openMPIData/"*file)
    save(stream, Pkg.dir("OpenMPIData",file))
  end

end
