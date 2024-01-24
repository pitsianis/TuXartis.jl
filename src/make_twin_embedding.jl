using Pkg
Pkg.instantiate()
using SGtSNEpi

include("adjacency2incidence.jl")
include("get_embedding_matrix.jl")


function make_twin_embedding(A; edim=2, ptype="walks", ksteps=2, lambda=10, iter_conv=50, embed_seed=0)
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
    Y_v: |V| x edim array, vertex coordiate vectors of dimension edim 
    Y_e: |E| x edim array, edge coordiate vectors of dimension edim 
    """


    Bo, H,  T = adjacency2incidence(A)
    B = abs.(Bo)
    m = size(B,1)
    n = size(B,2)

    Abp = sparse([zeros(Int64, m, m) B; B' zeros(Int64, n, n)] )

    A_twin, mat_type, figID = get_embedding_matrix(Abp, ptype, ksteps)

    A_twin = sparse(A_twin)

    #doubting whether the methodology is same as one in matlab
    Y_twin = sgtsnepi(A_twin,seed=1)

    Y_e = Y_twin[1:m, :]
    Y_v = Y_twin[m+1:m+n, :]

    return Y_v, Y_e
end

# A = [0 1 0 1;1 0 1 0; 0 1 0 1; 1 0 1 0]
# A_twin= make_twin_embedding(A; edim=2, ptype="walks", ksteps=2, lambda=10, iter_conv=50, embed_seed=0)

# using SparseArrays
# A= sprand(500,500,0.05)
# Y= sgtsnepi(A)

#Author: Cody
#Date: 2023-1-3
