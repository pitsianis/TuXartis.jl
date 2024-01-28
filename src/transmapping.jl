function transmapping(g::SimpleGraph, Y_v::Matrix{Float64}, Y_e::Matrix{Float64},)

# Show trans-mapping of vertex degree variable
deg = degree(g)[:,:]

vertex_indices = sortperm(deg, rev=true,dims = 1)[1:10]
edge_indices = v_to_e(B,vertex_indices)

# Vertex Map
vertex_colors = [i in vertex_indices ? :red : :grey for i in 1:size(Y_v, 1)]
vertex_alphas = [i in vertex_indices ? 1 : 0.1 for i in 1:size(Y_v, 1)]
plot_embedding(Y_v,color = vertex_colors, title = "vertex embedding", alpha = vertex_alphas)

# Edge Map
edge_colors = [i in edge_indices ? :blue : :grey for i in 1:size(Y_e, 1)]
edge_alphas = [i in edge_indices ? 1 : 0.1 for i in 1:size(Y_v, 1)]
plot_embedding(Y_e,color = edge_colors, title = "edge embedding",alpha = edge_alphas)

end