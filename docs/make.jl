using Documenter, OpenMPIData

makedocs(
    format = :html,
    modules = [OpenMPIData],
    sitename = "Open MPI Data",
    authors = "Tobias Knopp,...",
    pages = [
        "Home" => "index.md",
        "Usage" => "usage.md",
        "Scanners" => "scanners.md",
        "Tracers" => "tracers.md",
        "Phantoms" => "phantoms.md",
        "Sequences" => "sequences.md",
        "Calibration" => "calibration.md",
        "Datasets" => "datasets.md",
        "Reconstruction"=> "reconstructions.md"
    ],
)

deploydocs(repo   = "github.com/MagneticParticleImaging/OpenMPIData.jl.git",
           julia  = "release",
           target = "build",
           deps   = nothing,
           make   = nothing)
