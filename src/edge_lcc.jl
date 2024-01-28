using Graphs

function edge_lcc(G::SimpleGraph)
    """
    Input:
            G: SimpleGraph
    Output:
            edge_lcc: Vector{Float64} of edge local clustering coefficients
    """

    # Get adjacency matrix of line graph
    A = Graphs.adjacency_matrix(G)
    ALG = adjacency2linegraph(A)
    LG = Graphs.SimpleGraphs.SimpleGraph(ALG)

    # Get edge degree
    edge_lcc = Graphs.local_clustering_coefficient(LG)
    return edge_lcc
end

# Aaron Zhong
# 2021.1.28