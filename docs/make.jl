using TuXartis
using Documenter

DocMeta.setdocmeta!(TuXartis, :DocTestSetup, :(using TuXartis); recursive=true)

ALLPAGES = [
  "Home" => "index.md",
  "Technical description" => "technical_description.md",
  # [
  #     "Vertex/edge indices" => [
  #       "Vertex indices" => "vertex_indices.md",
  #       "Edge indices" => "edge_indices.md",
  #     ],
  #   "Spatial embedding" => "spatial_embedding.md",
  #   "Histogram images on spatial maps" => "histogram_on_maps.md",
  #   "Translation of histogram images" => "histogram_translation.md",
  # ],
  "Mathematical description" => "mathematical_description.md",
  "User interface" => "api.md",
  "References" => "references.md",
  "Related software packages" => "related_software.md",
  "Feedback" => "feedback.md",
  "Demos" => "demos.md",
]

makedocs(;
    modules=[TuXartis],
    authors="ACDNX",
    sitename="TuXartis.jl",
    format=Documenter.HTML(;
        canonical="https://pitsianis.github.io/TuXartis.jl",
        edit_link="main",
        # mathengine=Documenter.MathJax3(),
        assets=String[],
    ),
    pages=ALLPAGES,
)

deploydocs(;
    repo="github.com/pitsianis/TuXartis.jl",
    devbranch="main",
)
