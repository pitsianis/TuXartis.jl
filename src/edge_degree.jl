using Graphs
include("adjacency2linegraph.jl")
function edge_degree(G)
    """
    Input:
            G: SimpleGraph
    Output:
            edge_degree: Vector{Float64} of edge degrees
    """

    # Get adjacency matrix of line graph
    A = Graphs.adjacency_matrix(G)
    ALG = adjacency2linegraph(A)

    # Get edge degree
    edge_degree = sum(ALG, dims=1)[:]
    return edge_degree
end

# Aaron Zhong
# 2021.1.28