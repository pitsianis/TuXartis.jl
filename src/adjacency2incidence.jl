using LinearAlgebra
using SparseArrays

function adjacency2incidence(A)
    """
    Build the incidence matrix from the adjacency matrix
    
    Parameters:
    - A: adjacency matrix (undirected graph)
    
    Returns:
    - C: incidence matrix
    - H: positive component of the incidence matrix
    - T: negative component of the incidence matrix
    """
    # Check if A is symmetric
    if !(A == transpose(A))
        error("IncompatibleDirectedGraph", "Function does not work with directed graphs")
    end

    n = size(A, 1)
    m = cld(nnz(sparse(A)),2)
    
    # Convert A to sparse matrix if it's not already sparse
    if !issparse(A)
        A = sparse(A)
    end

    # idx = findall(triu(bitmatrix))
    idx = Tuple.(findall(!iszero, triu(A)))
    
    i = first.(idx)
    j = last.(idx)

    # Build the incidence matrix
    H = sparse(1:m, i, ones(m), m, n)
    T = sparse(1:m, j, ones(m), m, n)
    C = H - T
    
    return C, H, T
end

# Authors: Cody
# Date: 2023-1-12