using Graphs
function adjacency2linegraph(A)

    # Check if A is symmetric
    if !(A == A')
        error("IncompatibleDirectedGraph", "Function does not work with directed graphs")
    end

    G = SimpleGraph(A);
    # Convert to incidence matrix (assuming adjacency2incidence is defined)
    B = Graphs.incidence_matrix(G) .!= 0

    # Build line graph
    L = (B * B') .> 0
    L = L - Diagonal(diag(L))

    return L
end