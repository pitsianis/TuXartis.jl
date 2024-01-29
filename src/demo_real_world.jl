using Pkg
using SparseArrays, DelimitedFiles, GraphPlot, Graphs,SGtSNEpi
using Plots
using LightGraphs

include("plot_embedding.jl")
include("v_to_e.jl")
include("e_to_v.jl")
include("generate_graph.jl")
include("adjacency2linegraph.jl")
# include("transmapping.jl")
include("select_filter.jl")
include("make_twin_matrix.jl")
include("hist_map.jl")

# Function to read an edge list from a file and create a graph
function create_graph_from_edgelist(file_path)
    edges = readdlm(file_path, ',', Int, '\n')
    g = Graphs.SimpleGraphs.SimpleGraph(maximum(edges))
    for edge in eachrow(edges)
        Graphs.add_edge!(g, edge[1] + 1, edge[2] + 1)  # Adding 1 because Julia uses 1-based indexing
    end
    return g
end

# Path to your edge list file
file_path = "src/fb-pages-tvshow.txt"

# Create the graph
g = create_graph_from_edgelist(file_path)


A = Graphs.adjacency_matrix(g)
Y = sgtsnepi(A;d=2)

lcc = select_filter(g, "vertex local clustering coefficient")
deg = select_filter(g, "vertex degree")

hist_map(Y, lcc, numOfbins = 30,highlight_bin = 30,scale = "linear")




# # Generate the adjacency matrix
# A = Graphs.adjacency_matrix(g)
# ALG = adjacency2linegraph(A)

# # Try individual embedding
# Y_v = sgtsnepi(A;d=2)
# Y_e = sgtsnepi(ALG;d=2)

# # @save "Y_v.jld2" Y_v
# # @save "Y_e.jld2" Y_e

# # # Try twin-embedding
# A_twin = make_twin_matrix(A)
# Y_twin = sgtsnepi(A_twin,d=3)
# m = size(ALG,1)
# n = size(A,1)
# Y_e = Y_twin[1:m, :]
# Y_v = Y_twin[m+1:m+n, :]

# # demo
# sequence = "vertex degree"
# large2small = true
# index = [1,2,3,4,5]
# transmapping(g,Y_v,sequence,Y_e,large2small=large2small,indices=index)