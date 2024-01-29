function plot_embed(Y; color=:blue, xlabel="", ylabel="", title::String="", marksize=5, plot_size=(700, 700), alpha=0.5)
    num_cols = size(Y, 2)

    if num_cols == 2
        # 2D Plot
        p = scatter(Y[:, 1], Y[:, 2], label="", color=color, aspect_ratio=:equal, marksize=marksize, size=plot_size, framestyle=:zerolines, alpha=alpha)
    elseif num_cols == 3
        # 3D Plot
        p = scatter(Y[:, 1], Y[:, 2], Y[:, 3], label="", color=color, marksize=marksize, size=plot_size, framestyle=:zerolines, alpha=alpha)
    else
        error("Y must have 2 or 3 columns for 2D or 3D plotting respectively.")
    end

    if !isempty(xlabel)
        xlabel!(p, xlabel)
    end

    if !isempty(ylabel)
        ylabel!(p, ylabel)
    end

    if !isempty(title)  # Only add a title if it's not empty
        title!(p, title)
    end
    
    return p
end
