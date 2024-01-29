function e_to_v(B::AbstractMatrix, eidx::Vector{T}) where T
    """
    Input
    B: Incidence Matrix
    vidx: indices of edges

    Output
    eidx: indices of nodes incident to the inputed edges
    """

    # Check input
    @assert all(eidx .<= size(B, 2)) && all(eidx .> 0) "Invalid edge indices"

    
    submatrix = B[:, eidx]
    bitmatrix = submatrix .> 0

    # Find nodes that are incident to all edges
    any_incidents = any(bitmatrix, dims=2)
    vidx = findall(x -> x, vec(any_incidents))

    return vidx
end


# AC
# 2024.1.28