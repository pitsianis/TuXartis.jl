module TuXartis

using SparseArrays, DelimitedFiles, GraphPlot, Graphs, SGtSNEpi

export adjacency2linegraph, get_embedding_matrix, e_to_v, edge_degree, edge_lcc, generate_graph, get_embedding_matrix, get_indices, get_neighbor
export hist_map, load_rw, make_twin_matrix, plot_embed, select_filter, translation_maps, transmapping, v_to_e
 
include("adjacency2linegraph.jl")
include("get_embedding_matrix.jl")
include("e_to_v.jl")
include("edge_degree.jl")
include("edge_lcc.jl")
include("generate_graph.jl")
include("get_embedding_matrix.jl")
include("get_indices.jl")
include("get_neighbor.jl")
include("hist_map.jl")
include("load_rw.jl")
include("make_twin_matrix.jl")
include("plot_embed.jl")
include("select_filter.jl")
include("translation_maps.jl")
include("transmapping.jl")
include("v_to_e.jl")


end
