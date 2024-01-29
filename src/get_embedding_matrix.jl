using SparseArrays
using Graphs
using GraphPlot

function get_embedding_matrix(A, ptype, ksteps, figID=0)
    """
    INPUT
    A: nxn array, the adjacency matrix (unweighted in the current version)
    ptype: character string
           'similarity' -- sparse
           'walks'     -- can be sparse or dense
           'geodesic'  -- full
    ksteps: integer, positive, small
            the number of steps within ksteps
    figID: integer, optional, default is 0

    OUTPUT
    A2embed: nxn array, nonnegative
    A2embed is used as input to sg-t-SNE to be made (column) stochastic
    and globally scaled by the lambda-range-equations
    mat_type: character string -- 'sim' or 'distsq'
    figID: integer
    """

    mat_type = "sim"

    # T = zeros(size(A))

    if ptype == "similarity"
        T = A
    elseif ptype == "walks"
        alpha = 0.85  # the damping factor
        n = size(A, 1)
        T = A
        for k in 1:(ksteps-1)
            T = A * (diagm(ones(Float64, n)) + alpha * T)
        end
    elseif ptype == "geodesic"
        g = SimpleGraph(A .> 0)
        T = floyd_warshall_shortest_paths(g).dists
        # T .= T.^2  # Note: Uncomment this line for weighted graphs
        mat_type = "distsq"
    else
        error("Unsupported embedding-matrix type")
    end

    A2embed = T .- diagm(diag(T))  # drop any self-loops

    return A2embed, mat_type, figID
end

#Author: Cody
#Date: 2023-1-3