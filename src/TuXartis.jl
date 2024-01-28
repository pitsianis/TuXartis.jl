module TuXartis

using SparseArrays, DelimitedFiles, GraphPlot, Graphs, SGtSNEpi

include("adjacency2incidence.jl")
include("get_embedding_matrix.jl")
include("make_twin_matrix.jl")
include("plot_embedding.jl")
include("degreeTuXartis.jl")
include("vidx_to_eidx.jl")
include("generate_graph.jl")


end
