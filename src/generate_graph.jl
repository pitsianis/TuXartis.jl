"""
Generate a graph of the specified type with optional parameters.

Arguments:
- graph_type::String: Type of the graph to generate. Supported types: 
    "barabasi_albert", "watts_strogatz", "erdos_renyi", "complete_graph"
- kwargs: Optional keyword arguments specific to each graph type.

Returns:
- g: Generated graph.
"""
function generate_graph(graph_type; kwargs...)

    if graph_type == "barabasi_albert"
        n = get(kwargs, :n, 1000)
        n0 = get(kwargs, :n0, 10)
        k = get(kwargs, :k, 3)
        seed = get(kwargs, :seed, 1)
        return Graphs.barabasi_albert(n, n0, k, seed=seed)

    elseif graph_type == "watts_strogatz"
        n = get(kwargs, :n, 1000)
        k = get(kwargs, :k, 4)
        β = get(kwargs, :β, 0.01)
        return Graphs.watts_strogatz(n, k, β)

    elseif graph_type == "erdos_renyi"
        n = get(kwargs, :n, 1000)
        p = get(kwargs, :p, 0.5)
        return Graphs.erdos_renyi(n, p)

    elseif graph_type == "complete_graph"
        n = get(kwargs, :n, 10)
        return Graphs.complete_graph(n)

    else
        throw(ArgumentError("Invalid graph type: $graph_type"))
    end
end