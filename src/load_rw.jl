function load_rw(file_path)
    edges = readdlm(file_path, ' ', Int, '\n')
    g = Graphs.SimpleGraphs.SimpleGraph(maximum(edges))
    for edge in eachrow(edges)
        Graphs.add_edge!(g, edge[1] + 1, edge[2] + 1)  # Adding 1 because Julia uses 1-based indexing
    end
    return g
end