# include("plot_embed.jl")

function translation_maps(Y1,Y2,left_indices,right_indices,left_title,right_title)
    # Start Plotting
    # Left Map
    left_colors = [i in left_indices ? :red : :lightblue for i in 1:size(Y1, 1)]
    left_alphas = [i in left_indices ? 1 : 0.1 for i in 1:size(Y1, 1)]
    left_plot = plot_embed(Y1, color=left_colors, title=left_title, alpha=left_alphas)

    # Right Map
    right_colors = [i in right_indices ? :blue : :lightblue for i in 1:size(Y2, 1)]
    right_alphas = [i in right_indices ? 1 : 0.1 for i in 1:size(Y2, 1)]
    right_plot = plot_embed(Y2, color=right_colors, title=right_title, alpha=right_alphas)

    return plot(left_plot, right_plot, layout=(1, 2))
end