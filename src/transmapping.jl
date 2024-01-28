using Graphs
using Plots
plotlyjs()

include("select_filter.jl")
include("plot_embed.jl")
function transmapping(G,Y1::Matrix{Float64}, sequence::String,Y2::Matrix{Float64};large2small::Bool = true,
    indices::Vector{Int64}=[1,2,3,4,5])
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
    feature_filter = select_filter(G, sequence)

    # Get indices for highlighting points in left and right maps
    # If not specified, default is to hightlight the top 10%
    # with highest feature variable values
    # Default to top 10% of nodes based on the selected feature

    left_indices = sortperm(feature_filter, rev = large2small)[indices]
    if typeof(left_indices) == Int64
        left_indices = [left_indices]
    end
    right_indices = v_to_e(B, left_indices)


    # Start plotting

    # Left Map
    left_colors = [i in left_indices ? :red : :black for i in 1:size(Y1, 1)]
    left_alphas = [i in left_indices ? 1 : 0.1 for i in 1:size(Y1, 1)]
    left_plot = plot_embed(Y1, color=left_colors, title="Left Map", alpha=left_alphas)

    # Right Map
    right_colors = [i in right_indices ? :blue : :black for i in 1:size(Y2, 1)]
    right_alphas = [i in right_indices ? 1 : 0.1 for i in 1:size(Y2, 1)]
    right_plot = plot_embed(Y2, color=right_colors, title="Right Map", alpha=right_alphas)

    # Display both plots side by side
    combined_plot = plot(left_plot, right_plot, layout=(1, 2))
    display(combined_plot)

end

# Aaron Zhong
# 2021.1.28