using Pkg
using SparseArrays, DelimitedFiles, GraphPlot, Graphs,SGtSNEpi
using Plots
using LightGraphs

include("plot_embedding.jl")
include("v_to_e.jl")
include("e_to_v.jl")
include("generate_graph.jl")


g = generate_graph("barabasi_albert",n = 1000, d = 10, k = 3, seed =1)
A = Graphs.adjacency_matrix(g)

Y = sgtsnepi(g)

B = Graphs.incidence_matrix(g)

# call function from TuXartis.jl to see trans-mapping of desired variable
TuXartis.transmapping(g,Y);


