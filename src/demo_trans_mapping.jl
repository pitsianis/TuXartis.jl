using Pkg
using SparseArrays, DelimitedFiles, GraphPlot, Graphs,SGtSNEpi
using Plots
using LightGraphs

include("plot_embedding.jl")
include("v_to_e.jl")
include("e_to_v.jl")
include("generate_graph.jl")
include("adjacency2linegraph.jl")


g = generate_graph("barabasi_albert",n = 1000, d = 10, k = 3, seed =1)
A = Graphs.adjacency_matrix(g)
ALG = adjacency2linegraph(A)

Y_v = sgtsnepi(A;d=3)
Y_e = sgtsnepi(ALG;d=3)


# demo

transmapping(G,Y_v,Y_e,sequence);


# TuXartis.hist_map(G,Y,sequence);


