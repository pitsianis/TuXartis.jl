function transmapping(G::SimpleGraph, Y1::Matrix{Float64}, sequence::String,Y2::Matrix{Float64},
    indices::Vector{Int64})
    """
    Input:
            g: SimpleGraph
            Y1 and Y2: two embedding coordinates that is going to be analyzed at once
                        can be both vertex or both edge coordinates, or one vertex coordinate and one edge
                        coordinate

    Output:

    """

    # Process data and compute necessary matrices
    A = Graphs.adjacency_matrix(G)
    B = Graphs.incidence_matrix(G)

    # Select filter based on input sequence
    filter = selec_filter(G, sequence)

    # Get indices for highlighting points in left and right maps
    # If not specified, default is to hightlight the top 10%
    # with highest feature variable values
    if isempty(indices)
        # Default to top 10% of nodes based on the selected feature
        num_highlight = max(1, round(Int, 0.1 * nv(G)))  # At least 1 node
        left_indices = sortperm(filter, rev=true)[1:num_highlight]
    else
        left_indices = indices
    end

    right_indices = v_to_e(B, left_indices)


    # Start plotting

    # Left Map
    left_colors = [i in left_indices ? :red : :grey for i in 1:size(Y1, 1)]
    left_alphas = [i in left_indices ? 1 : 0.1 for i in 1:size(Y1, 1)]
    plot_embed(Y_v,color = left_colors, title = "vertex embedding", alpha = left_alphas)

    # Right Map
    right_colors = [i in right_indices ? :blue : :grey for i in 1:size(Y2, 1)]
    right_alphas = [i in right_indices ? 1 : 0.1 for i in 1:size(Y2, 1)]
    plot_embed(Y_e,color = right_colors, title = "edge embedding",alpha = right_alphas)

end

# Aaron Zhong
# 2021.1.28