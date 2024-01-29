using Pkg
using SparseArrays, DelimitedFiles, GraphPlot, Graphs,SGtSNEpi
using Plots
using LightGraphs

include("plot_embedding.jl")
include("v_to_e.jl")
include("e_to_v.jl")
include("generate_graph.jl")
include("adjacency2linegraph.jl")
include("transmapping.jl")
include("select_filter.jl")
include("make_twin_matrix.jl")


G = generate_graph("watts_strogatz",n = 1000, k = 4, β = 0.01, seed =1)
A = Graphs.adjacency_matrix(G)
ALG = adjacency2linegraph(A)

# Try individual embedding
Y_v = sgtsnepi(A;d=3)
Y_e = sgtsnepi(ALG;d=3)

# Try twin-embedding
A_twin = make_twin_matrix(A)
Y_twin = sgtsnepi(A_twin,d=3)
m = size(ALG,1)
n = size(A,1)
Y_e = Y_twin[1:m, :]
Y_v = Y_twin[m+1:m+n, :]


# demo
sequence = "vertex degree"
large2small = true
index = [1,2,3]
display_fig = true
title = "ws3d"
transmapping(G,Y_v,sequence,Y_e,display_fig,title,large2small=large2small,indices=index)


# TuXartis.hist_map(G,Y,sequence);