
g = generate_graph("barabasi_albert",n = 1000, d = 5, k = 3, seed =1)

Y = sgtsnepi(g)


A = Graphs.adjacency_matrix(g)

Bo, H,  T = adjacency2incidence(A)
B = abs.(Bo)

A_twin = make_twin_matrix(A)

plot_embedding(Y, title = "single embedding")

Y_twin = sgtsnepi(A_twin)

m = size(B,1)
n = size(B,2)
Y_e = Y_twin[1:n, :]
Y_v = Y_twin[m+1:m+n, :]


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