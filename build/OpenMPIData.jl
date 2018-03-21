module OpenMPIData

using Reexport
if !isdir(Pkg.dir("MPIFiles"))
  println("Installing MPIFiles...")
  Pkg.clone("https://github.com/MagneticParticleImaging/MPIFiles.jl.git")
end
@reexport using MPIFiles
@reexport using PyPlot

include("download.jl")
include("reconstruction.jl")
include("visualization.jl")

end # module
