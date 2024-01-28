using Graphs
include("edge_degree.jl")
include("edge_lcc.jl")

function select_filter(G, sequence::String)
    filters = Dict(
        "vertex degree" => () -> Graphs.degree(G),
        "vertex local clustering coefficient" => () -> Graphs.local_clustering_coefficient(G),
        "vertex betweenness centrality" => () -> Graphs.betweenness_centrality(G),
        "edge degree" => () -> edge_degree(G),
        "edge local clustering coefficient" => () -> edge_lcc(G),  
        # "Forman-Ricci curvature" => () -> forman_ricci_curvature(G)  # Assuming this function is defined
    )

    filter_func = get(filters, sequence, () -> error("Invalid sequence. Please choose from supported sequences."))
    return filter_func()
end

# Aaron Zhong
# 2021.1.28
