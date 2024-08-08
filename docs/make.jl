using HypoExponential
using Documenter

DocMeta.setdocmeta!(HypoExponential, :DocTestSetup, :(using HypoExponential); recursive=true)

makedocs(;
    modules=[HypoExponential],
    authors="Jonathan Miller jonathan.miller@fieldofnodes.com",
    sitename="HypoExponential.jl",
    format=Documenter.HTML(;
        canonical="https://fieldofnodes.github.io/HypoExponential.jl",
        edit_link="main",
        assets=String[],
    ),
    pages=[
        "Home" => "index.md",
    ],
)

deploydocs(;
    repo="github.com/fieldofnodes/HypoExponential.jl",
    devbranch="main",
)
