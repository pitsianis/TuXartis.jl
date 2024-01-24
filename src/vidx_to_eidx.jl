function vidx_to_eidx(B::AbstractMatrix, eidx::Vector{T}) where T
    """
    Input
    B: Incidence Matrix
    vidx: indices of nodes

    Output
    eidx: indices of edges incident to the inputed nodes
    """

    #Check the validity of input eidx
    edim = 2
    @assert all(eidx .<= size(B, edim)) && all(eidx .> 0) "Invalid vertex vertices"

    # Get the indices to the incident vertices
    submatrix = B[eidx,:]
    bitmatrix = submatrix .> 1/2
    non_zeros = any(bitmatrix,dims=1)
    vidx = findall(x -> x == 1, vec(non_zeros))

    return vec(vidx)  # Cast into a column vector
end

# Authors: Cody and Aaron
# Date: 2023-12-28