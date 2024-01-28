# instead of using switch cases, we can use a type hierarchy and dispatch on the
# type
using Parameters
using Random
abstract type GraphData end



###############################################################################
#                              Erdos-Renyi graph                              #
###############################################################################


@kwdef struct ERGraph <: GraphData
  n::Int = 1000
  d::Int = 20
end

function generate( T::ERGraph; seed::Int = 0 )

  # set the seed
  Random.seed!( seed )

  @unpack n, d = T

  m = round( Int, d * n / 2 )

  @info "Generating an Erdős–Rényi random graph"
  A = adjacency_matrix( erdos_renyi( n, m; seed ), Bool )

  return A

end # function generate

# -----------------------------------------------------------------------------




###############################################################################
#                            Barabasi-Albert graph                            #
###############################################################################


@kwdef struct BAGraph <: GraphData
  n::Int  = 1000
  d::Int  = 20
  n0::Int = d
  complete::Bool = false
end

function generate( T::BAGraph; seed::Int = 0 )

  # set the seed
  Random.seed!( seed )

  @unpack n, d, n0, complete = T

  @info "Generating a Barabási–Albert random graph"
  A = adjacency_matrix( barabasi_albert( n, n0, d; seed, complete ), Bool )

  return A

end # function generate

# -----------------------------------------------------------------------------



###############################################################################
#                             Watts-Strogatz graph                            #
###############################################################################


@kwdef struct SWGraph <: GraphData
  n::Int = 1000
  d::Int = 20
  r::Float64 = 0.01
end

function generate( T::SWGraph; seed::Int = 0 )

  # set the seed
  Random.seed!( seed )

  @unpack n, d, r = T

  @info "Generating a Watts–Strogatz random graph"
  A = adjacency_matrix( watts_strogatz( n, d, r; seed ), Bool )

  return A

end # function generate

# -----------------------------------------------------------------------------



###############################################################################
#                            Random geometric graph                           #
###############################################################################


@kwdef struct RGGraph <: GraphData
  n::Int = 1000
  d::Int = 20
  dim::Int = 2
end

function generate( T::RGGraph; seed::Int = 0 )

  # set the seed
  Random.seed!( seed )

  @unpack n, d, dim = T

  m = round( Int, d * n / 2 )

  @info "Generating a random geometric graph"

  # initial hypothesis for cutoff; then we refine it until we get the desired
  # number of edges
  cutoff = m / ( n * ( n - 1 ) / 2 )
  left   = cutoff / 10
  right  = cutoff * 10

  A = adjacency_matrix( euclidean_graph( n, dim; cutoff, seed )[1], Bool )

  while !isapprox( nnz(A), 2m; rtol = 0.005 )
    # binary search between left and cutoff or right and cutoff
    if nnz(A) < 2m
      left = cutoff
      cutoff = ( cutoff + right ) / 2
    else
      right = cutoff
      cutoff = ( cutoff + left ) / 2
    end
    A = adjacency_matrix( euclidean_graph( n, dim; cutoff, seed )[1], Bool )
    @info nnz(A)
  end


  return A

end # function generate

# -----------------------------------------------------------------------------


###############################################################################
#                                  Mycielski                                  #
###############################################################################


@kwdef struct MycielskiGraph <: GraphData
  n::Int = 1000
end

function generate(T::MycielskiGraph; seed::Int = 0)
  M = sparse([0 1; 1 0])  # two-nodes, single edge

  @unpack n = T

  while true
    M = Mski_recursion(M)
    if size(M,1) >= n
      break
    end
  end

  return SparseMatrixCSC{Bool}(M)
end

function Mski_recursion(M)
  n = size(M, 1)
  m = nnz(M)  # 2|E(G)|

  n2 = 2 * n + 1  # (n+1) new vertices, 2m+n new edges
  m2 = 3 * m + 2 * n  # M copied as a subgraph and
  # as a bipartite btw nodes(1:n) and nodes(n+(1:n))
  # + K_{n,1} with the start center at node (2n+1)
  # m2 = 2|E(nuG)|

  nuM = spzeros(n2, n2)

  nuM[1:n, 1:n] = M  # copy the old to the leading matrix
  nuM[n .+ (1:n), :] = hcat(M, spzeros(n, n), ones(n, 1))
  nuM[:, n .+ (1:n)] = vcat(M, spzeros(n, n), ones(1, n))

  return nuM
end

# -----------------------------------------------------------------------------
