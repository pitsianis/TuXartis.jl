using Plots,Graphs,SGtSNEpi
include("generate_graph.jl")
include("plot_embedding.jl")

g = generate_graph("barabasi_albert",n = 1000, d = 10, k = 3, seed =1)
deg = degree(g)[:,:]

vertex_indices = sortperm(deg, rev=true,dims = 1)[a]

a = (1:10)

Y = sgtsnepi(g;d=2)

function hist_map(y::Matrix, sequence::Matrix; color=:red, highlight_indices=1:10, large2small=true, alpha = 5)
    vertex_indices = sortperm(vec(sequence), rev=large2small)[highlight_indices]

    # Create scatter plot
    point_colors = [i in highlight_indices ? color : :lightblue for i in 1:size(y, 1)]
    point_alphas = [i in highlight_indices ? 1 : 0.1 for i in 1:size(y, 1)]
    scatter_plot = plot_embedding(y,color = point_colors, title = "", alpha = point_alphas, size = (350,350))

    # Create the first histogram plot with specified bin edges and range
    histogram_plot = histogram(vec(sequence),bins = 0:1:100, orientation=:vertical, legend=false,
                                xlims=(0, maximum(sequence)),ylims = (0,1),normalize=:probability)

    # Create the second histogram using the same bin edges and range
    histogram!(histogram_plot, bins = 0:1:100,sequence[highlight_indices], color=color, orientation=:vertical,
                                xlims=(0,maximum(sequence)),ylims = (0,1),normalize=:probability)

    # Plot the scatter plot and histogram as subplots
    plot(scatter_plot, histogram_plot, layout=(2, 1), size=(800, 600))
end


hist_map(Y, deg, highlight_indices = (1:50))

point_colors = [i in highest_degree_ver ? :red : :grey for i in 1:size(Y_v, 1)]
point_alphas = [i in highest_degree_ver ? 1 : 0.1 for i in 1:size(Y_v, 1)]
plot_embedding(Y_v,color = point_colors, title = "", alpha = point_alphas)
