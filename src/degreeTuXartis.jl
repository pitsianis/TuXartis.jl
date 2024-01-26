function degreeTuXartis(A::AbstractMatrix)
    """
    The function to get the  degree sequence.
    """
    A = A .> 1/2          # removal of edge weights 
    d = sum(A, dims=2)      # degree sequence, column vector of row-sums
    return d
end

# Authors: Cody
# Date: 2023-1-13