using SparseArrays
using DelimitedFiles, SGTSNEDKU

include("adjacency2incidence.jl")
include("get_embedding_matrix.jl")
include("make_twin_embedding.jl")
include("plot_embedding.jl")
include("degreeTuXartis.jl")
include("vidx_to_eidx.jl")


n = 1000
d = 5
seed = 1
A = SGTSNEDKU.generate( SGTSNEDKU.BAGraph(; n, d); seed )

Bo, H,  T = adjacency2incidence(A)
B = abs.(Bo)
Y_v, Y_e = make_twin_embedding(A)


deg = degreeTuXartis(A) #get degree sequence

using Plots

highest_degree_ver = sortperm(deg, rev=true,dims = 1)[1:10]
highest_degree_edg = vidx_to_eidx(B, highest_degree_ver)

# Vertex Embedding
vertex_colors = [i in highest_degree_ver ? :red : :grey for i in 1:size(Y_v, 1)]
vertex_alphas = [i in highest_degree_ver ? 1 : 0.1 for i in 1:size(Y_v, 1)]
plot_embedding(Y_v,color = vertex_colors, title = "vertex embedding", alpha = vertex_alphas)

# Edge Embedding
edge_colors = [i in highest_degree_edg ? :blue : :grey for i in 1:size(Y_e, 1)]
edge_alphas = [i in highest_degree_edg ? 1 : 0.1 for i in 1:size(Y_v, 1)]
plot_embedding(Y_e,color = edge_colors, title = "edge embedding",alpha = edge_alphas)

# scatter(Y_v[:, 1], Y_v[:, 2], label="", color="blue", aspect_ratio=:equal,marksize =5, size = (600,600),framestyle=:zerolines, alpha =0.5)
    

## Author: Cody
## Date: 2024-1-17