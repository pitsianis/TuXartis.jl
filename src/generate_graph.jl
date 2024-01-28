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
        d = get(kwargs, :d, 5)
        k = get(kwargs, :k, 3)
        seed = get(kwargs, :seed, 1)
        return Graphs.barabasi_albert(n, d, k, seed=seed)

    elseif graph_type == "watts_strogatz"
        n = get(kwargs, :n, 1000)
        d = get(kwargs, :d, 4)
        p = get(kwargs, :p, 10)
        return Graphs.watts_strogatz(n, d, p)

    elseif graph_type == "erdos_renyi"
        n = get(kwargs, :n, 1000)
        ne = get(kwargs, :ne, 10)
        return Graphs.erdos_renyi(n, ne)

    elseif graph_type == "complete_graph"
        n = get(kwargs, :n, 10)
        return Graphs.complete_graph(n)

    else
        throw(ArgumentError("Invalid graph type: $graph_type"))
    end
end