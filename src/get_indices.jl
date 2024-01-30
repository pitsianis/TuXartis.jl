using Graphs
function get_indices(G,indices,feature_filter,large2small,trans_type)
    B = Graphs.incidence_matrix(G)
    left_indices = sortperm(feature_filter, rev = large2small)[indices]
    if typeof(left_indices) == Int64
        left_indices = [left_indices]
    end

    if trans_type == "v-v"
        right_indices = get_neighbors(G, left_indices)
    elseif trans_type  == "e-e"
        temp = e_to_v(B, left_indices)
        right_indices = v_to_e(B, temp)
    else
        right_indices = v_to_e(B, left_indices)
    end
    
    return left_indices, right_indices
end