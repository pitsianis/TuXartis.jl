function get_neighbors(G::Graphs.SimpleGraphs.SimpleGraph{Int64}, nodes::AbstractVector)
    neighbors_set = Set{Int}()
    for node in nodes
        union!(neighbors_set, Graphs.neighbors(G, node))
    end
    return collect(neighbors_set)
end