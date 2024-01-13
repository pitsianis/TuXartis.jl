using TuXartis
using Documenter

DocMeta.setdocmeta!(TuXartis, :DocTestSetup, :(using TuXartis); recursive=true)

makedocs(;
    modules=[TuXartis],
    authors="Dimitris Floros <flojim4@gmail.com> and contributors",
    sitename="TuXartis.jl",
    format=Documenter.HTML(;
        canonical="https://fcdimitr.github.io/TuXartis.jl",
        edit_link="main",
        assets=String[],
    ),
    pages=[
        "Home" => "index.md",
    ],
)

deploydocs(;
    repo="github.com/fcdimitr/TuXartis.jl",
    devbranch="main",
)
