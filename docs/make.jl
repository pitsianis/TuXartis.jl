using TuXartis
using Documenter

DocMeta.setdocmeta!(TuXartis, :DocTestSetup, :(using TuXartis); recursive=true)

makedocs(;
    modules=[TuXartis],
    authors="ACDNX",
    sitename="TuXartis.jl",
    format=Documenter.HTML(;
        canonical="https://pitsianis.github.io/TuXartis.jl",
        edit_link="main",
        assets=String[],
    ),
    pages=[
        "Home" => "index.md",
    ],
)

deploydocs(;
    repo="github.com/pitsianis/TuXartis.jl",
    devbranch="main",
)
