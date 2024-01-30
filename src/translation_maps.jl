# include("plot_embed.jl")

function translation_maps(Y1,Y2,left_indices,right_indices,left_title,right_title)
    embed_dim = size(Y, 2)

    # Start Plotting
    if embed_dim == 2
        left_colors = [i in left_indices ? :red : :lightblue for i in 1:size(Y1, 1)]
        left_alphas = [i in left_indices ? 1 : 0.1 for i in 1:size(Y1, 1)]
        left_plot = plot_embed(Y1, color=left_colors, title=left_title, alpha=left_alphas)

        right_colors = [i in right_indices ? :blue : :lightblue for i in 1:size(Y2, 1)]
        right_alphas = [i in right_indices ? 1 : 0.1 for i in 1:size(Y2, 1)]
        right_plot = plot_embed(Y2, color=right_colors, title=right_title, alpha=right_alphas)
    elseif embed_dim == 3
        left_colors = [i in left_indices ? :red : :black for i in 1:size(Y1, 1)]
        left_alphas = [i in left_indices ? 1 : 0.1 for i in 1:size(Y1, 1)]
        left_plot = plot_embed(Y1, color=left_colors, title=left_title, alpha=left_alphas)

        right_colors = [i in right_indices ? :blue : :black for i in 1:size(Y2, 1)]
        right_alphas = [i in right_indices ? 1 : 0.1 for i in 1:size(Y2, 1)]
        right_plot = plot_embed(Y2, color=right_colors, title=right_title, alpha=right_alphas)   

    end


    return plot(left_plot, right_plot, layout=(1, 2))
end