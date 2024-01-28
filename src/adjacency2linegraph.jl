using Graphs
using SimpleGraphs
using LinearAlgebra
function adjacency2linegraph(A)
    """
    Input:
            A: Adjacency matrix of a simple graph
    Output:
            L: Adjacency matrix of the line graph of the input graph
    """

    # Check if A is symmetric
    if !(A == A')
        error("IncompatibleDirectedGraph", "Function does not work with directed graphs")
    end

    G = Graphs.SimpleGraphs.SimpleGraph(A);
    # Convert to incidence matrix (assuming adjacency2incidence is defined)
    B = Graphs.incidence_matrix(G) .!= 0

    # Build line graph
    L = (B' * B) .> 0
    L = L - Diagonal(Diagonal(L))

    return L
end

# AC
# 2024.1.28