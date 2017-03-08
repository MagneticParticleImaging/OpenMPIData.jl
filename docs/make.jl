using Documenter, OpenMPIData

makedocs(
    format = :html,
    modules = [OpenMPIData],
    sitename = "OpenMPIData.jl",
    authors = "Tobias Knopp,...",
    pages = [
        "Home" => "index.md",
        "Getting Started" => "gettingStarted.md",
    ],
)

deploydocs(repo   = "github.com/MagneticParticleImaging/OpenMPIData.jl.git",
           julia  = "release",
           target = "build",
           deps   = nothing,
           make   = nothing)

