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
    html_prettyurls = false, #!("local" in ARGS)
)

deploydocs(repo   = "github.com/MagneticParticleImaging/OpenMPIData.jl.git",
           target = "build")
