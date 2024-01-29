# plotlyjs()
# include("select_filter.jl")
# include("plot_embed.jl")
# include("get_indices.jl")
# include("translation_maps.jl")

"""
transmapping(G, Y1, sequence, Y2; large2small=true, indices=[1,2,3,4,5])

Perform a translation mapping of histogram between vertex-vertex/edge-edge/vertex-edge embedding maps.

# Arguments
- `T`: A `SimpleGraph` or 'SparseMatrixCSC' object representing the graph.
- `Y1`: A `Matrix{Float64}` representing the first set of embedding coordinates (e.g., vertex coordinates).
- `sequence`: A `String` specifying the sequence type for the filter.
    currently supported sequences are: "vertex degree", "vertex local clustering coefficient"
    "vertex betweenness centrality", "edge degree", "edge local clustering coefficient".
- `Y2`: A `Matrix{Float64}` representing the second set of embedding coordinates (e.g., edge coordinates).
- `large2small` (optional): A `Bool` indicating the sorting order. Defaults to `true`.
- `indices` (optional): A `Vector{Int64}` specifying the indices for highlighting. Defaults to `[1,2,3,4,5]`.

# Returns
This function returns an interactive window for users to explore the translation mapping.

# Examples
using SGtSNEpi, Random

Random.seed!(0);
Y0 = 0.01 * randn( size(A,1), 2 );
Y = sgtsnepi(A; Y0 = Y0);

sequence = "vertex degree"
large2small = true
index = [1,2,3,4,5]
transmapping(g,Y_v,sequence,Y_e,large2small=large2small,indices=index)
"""

function transmapping(T,Y1::Matrix{Float64}, sequence::String,Y2::Matrix{Float64},trans_type::String,
    display_fig::Bool=false,title::String="Translation Mapping";large2small::Bool = true,
    indices::Vector{Int64}=[1,2,3,4,5])

    # Check input type
    if typeof(T) == Graphs.SimpleGraphs.SimpleGraph{Int64}
        G = T
        A = Graphs.adjacency_matrix(G)
        B = Graphs.incidence_matrix(G)
    elseif typeof(T) == SparseMatrixCSC
        A = T
        G = Graphs.SimpleGraphs.SimpleGraph(A)
        B = incidence_matrix(A)
    else
        error("Input graph must be either a SimpleGraph or a SparseMatrixCSC")
    end

    # Select filter based on input sequence
    feature_filter = select_filter(G, sequence)

    # Get indices for highlighting points in left and right maps
    left_indices, right_indices = get_indices(G,indices,feature_filter,large2small,trans_type)

    # Set title for subplots
    if trans_type == "v-v"
        left_title = "Vertex Embedding"
        right_title = "Vertex Embedding"
    elseif trans_type  == "e-e"
        left_title = "Edge Embedding"
        right_title = "Edge Embedding"
    else
        left_title = "Vertex Embedding"
        right_title = "Edge Embedding"
    end


    # Plot translation maps
    trans_map = translation_maps(Y1,Y2,left_indices,right_indices,left_title,right_title)

    if display_fig
        display(trans_map)
    end
    saved_title = string(title, ".png")
    savefig(trans_map, saved_title)

end

# Aaron Zhong
# 2021.1.28