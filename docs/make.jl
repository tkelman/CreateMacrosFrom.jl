using Documenter, CreateMacrosFrom

# for successful deployment, make sure to
# - add a gh-pages branch on github
# - set up SSH deploy keys
# see https://juliadocs.github.io/Documenter.jl/latest/man/hosting.html for further instructions
deploydocs(
    repo = "github.com/bramtayl/CreateMacrosFrom.jl.git",
    target = "build",
    deps = nothing,
    make = nothing
)
