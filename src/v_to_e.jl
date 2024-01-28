function v_to_e(B::AbstractMatrix, vidx::Vector{T}) where T
    """
    Input
    B: Incidence Matrix
    vidx: indices of nodes

    Output
    eidx: indices of edges incident to the inputed nodes
    """

    # Check input
    @assert all(vidx .<= size(B, 1)) && all(vidx .> 0) "Invalid vertex indices"

    # Get the submatrix for the given edges
    submatrix = B[vidx, :]
    bitmatrix = submatrix .> 0

    # Get the indices of the incident edges
    non_zeros = any(bitmatrix, dims=1)
    eidx = findall(x -> x, vec(non_zeros))

    return eidx
end


# AC
# 2024.1.28