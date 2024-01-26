using Pkg
Pkg.instantiate()

include("adjacency2incidence.jl")
include("get_embedding_matrix.jl")


function make_twin_matrix(A; edim=2, ptype="walks", ksteps=2, lambda=10, iter_conv=50, embed_seed=0)
    """
    Input
    A: nxn adjacency matrix for a graph undirected, weighted or unweighted 
      optional parameters:
      - 'edim'   (default: 2): the embedding dimension 
      - 'ptype'  (default: 'walks'): the type of random walks 
      - 'ksteps' (default: 2): a finite number of walk steps 
      - 'lambda' (default: 10): the initial value of the lambda parameter for SG-tSNE-Π.
      - 'iter_conv' (default: 50): the number of iterations to use for the convergence of SG-tSNE-Π.
      - 'embed_seed' (default: 0) 

    Output
    A_twin: (n+m)*(n+m) twin embedding matrix
    """


    Bo, H,  T = adjacency2incidence(A)
    B = abs.(Bo)
    m = size(B,1)
    n = size(B,2)

    Abp = sparse([zeros(Int64, m, m) B; B' zeros(Int64, n, n)] )

    A_twin, mat_type, figID = get_embedding_matrix(Abp, ptype, ksteps)

    A_twin = sparse(A_twin)


    return A_twin
end

#Author: Cody
#Date: 2023-1-3
