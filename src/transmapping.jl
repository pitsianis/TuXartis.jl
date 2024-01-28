function transmapping(g::SimpleGraph, Y1::Matrix{Float64},sequence1, Y2::Matrix{Float64})
    """
    Input:
            g: SimpleGraph
            Y1 and Y2: two embedding coordinates that is going to be analyzed at once
                        can be both vertex or both edge coordinates, or one vertex coordinate and one edge
                        coordinate

    Output:

    """

    # Process data and compute necessary matrices
    A = Graphs.adjacency_matrix(g)
    B = Graphs.incidence_matrix(g)
    ALG = adjacency2linegraph(A)


    deg = degree(g)[:,:]

    vertex_indices = sortperm(deg, rev=true,dims = 1)[1:10]
    edge_indices = v_to_e(B,vertex_indices)

    # Vertex Map
    vertex_colors = [i in vertex_indices ? :red : :grey for i in 1:size(Y1, 1)]
    vertex_alphas = [i in vertex_indices ? 1 : 0.1 for i in 1:size(Y1, 1)]
    plot_embedding(Y_v,color = vertex_colors, title = "vertex embedding", alpha = vertex_alphas)

    # Edge Map
    edge_colors = [i in edge_indices ? :blue : :grey for i in 1:size(Y2, 1)]
    edge_alphas = [i in edge_indices ? 1 : 0.1 for i in 1:size(Y2, 1)]
    plot_embedding(Y_e,color = edge_colors, title = "edge embedding",alpha = edge_alphas)

end