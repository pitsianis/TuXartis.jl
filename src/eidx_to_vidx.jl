function eidx_to_vidx(B::AbstractMatrix, eidx::Vector{T}) where T
    """
    Input
    B: Incidence Matrix
    eidx: indices of edges

    Output
    vidx: indices of nodes incident to the inputed edges
    """

    # Check the validity of input eidx

    edim = 2
    @assert all(eidx .<= size(B, edim)) && all(eidx .> 0) "Invalid edge vertices"
    

    # Get the indices to the incident vertices
    submatrix = B[:,eidx]
    bitmatrix = submatrix .> 1/2
    non_zeros = any(bitmatrix,dims=2)
    vidx = findall(x -> x == 1, vec(non_zeros))

    return vec(vidx)  # Cast into a column vector
end

# Authors: Cody and Aaron
# Date: 2023-12-28