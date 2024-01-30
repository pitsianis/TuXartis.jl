using Pkg
using SparseArrays, DelimitedFiles, GraphPlot, Graphs,SGtSNEpi
using Plots
using LightGraphs

include("v_to_e.jl")
include("e_to_v.jl")
include("generate_graph.jl")
include("adjacency2linegraph.jl")
include("transmapping.jl")
include("select_filter.jl")
include("make_twin_matrix.jl")
include("hist_map.jl")


G = generate_graph("barabasi_albert",n = 1000, n0 = 10, k = 3, seed =1)
A = Graphs.adjacency_matrix(G)
ALG = adjacency2linegraph(A)

# Individual embedding, here we use SGtSNEpi
embedding_dimension = 3
# Y_v = sgtsnepi(A;d=embedding_dimension)
# Y_e = sgtsnepi(ALG;d=embedding_dimension)

# twin-embedding
A_twin = make_twin_matrix(A)
Y_twin = sgtsnepi(A_twin,d=embedding_dimension)
m = size(ALG,1)
n = size(A,1)
Y_twin_e = Y_twin[1:m, :]
Y_twin_v = Y_twin[m+1:m+n, :]

# Compute feature variables
# vertex variables
v_deg = select_filter(G, "vertex degree")
v_lcc = select_filter(G, "vertex local clustering coefficient")
v_centrality = select_filter(G,"vertex betweenness centrality")

# edge variables
e_deg = select_filter(G, "edge degree")
e_lcc = select_filter(G,"edge local clustering coefficient")

### His_map demo
# vertex map
hist_map(Y_twin_v, v_deg, numOfbins = 30,highlight_bin = 5,scale = "linear-linear")
hist_map(Y_twin_v, v_lcc, numOfbins = 20,highlight_bin = 10,scale = "log-linear")
hist_map(Y_twin_v, v_centrality, numOfbins = 50,highlight_bin = 28,scale = "log-log")

# @test maximum(v_deg) == 6

# edge map
hist_map(Y_twin_e, e_deg, numOfbins = 30,highlight_bin = 30,scale = "linear-log")
hist_map(Y_twin_e, e_lcc, numOfbins = 30,highlight_bin = 1,scale = "log-log")

### Transmapping demo
sequence = "vertex degree"
large2small = true
index = [1,2,3]
display_fig = true
title = "syntheticdemo1"
translation_type = "v-e"
transmapping(G,Y_twin_v,sequence,Y_twin_e,translation_type,display_fig,title,large2small=large2small,
indices=index)

sequence = "vertex local clustering coefficient"
large2small = false
index = [1,2,3,4,5]
display_fig = true
title = "syntheticdemo2"
translation_type = "v-v"
transmapping(G,Y_twin_v,sequence,Y_twin_v,translation_type,display_fig,title,large2small=large2small,
indices=index)

sequence = "edge degree"
large2small = true
index = [1]
display_fig = true
title = "syntheticdemo3"
translation_type = "e-e"
transmapping(G,Y_twin_e,sequence,Y_twin_e,translation_type,display_fig,title,large2small=large2small,
indices=index)

###
