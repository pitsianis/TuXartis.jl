using Plots,Graphs,SGtSNEpi
using Statistics
include("generate_graph.jl")
include("plot_embedding.jl")


function hist_map(y::Matrix, sequence::Vector; scale = "linear", color=:red, numOfbins = 10, highlight_bin = 1)

    widthOfbins = (maximum(sequence)-minimum(sequence))/numOfbins

    min = minimum(sequence)+ widthOfbins*(highlight_bin-1)
    max = minimum(sequence)+ widthOfbins*(highlight_bin)

    highlight_indices = findall(x -> x >= min && x <= max, sequence)

    if scale == "linear"
        histogram_plot = histogram(vec(sequence),bins = minimum(sequence):widthOfbins:maximum(sequence), orientation=:vertical, legend=false,
                                    xlims=(0, maximum(sequence)),normalize=:probability)
    elseif scale == "ylog"
        histogram_plot = histogram(vec(sequence),bins = minimum(sequence):widthOfbins:maximum(sequence), orientation=:vertical, legend=false,
                                    xlims=(0, maximum(sequence)),normalize=:probability,yscale=:log10)
    elseif scale == "xlog"
        histogram_plot = histogram(vec(sequence),bins = minimum(sequence):widthOfbins:maximum(sequence), orientation=:vertical, legend=false,
                                    xlims=(0, maximum(sequence)),normalize=:probability,xscale=:log10)   
    elseif scale =="loglog"
        histogram_plot = histogram(vec(sequence),bins = minimum(sequence):widthOfbins:maximum(sequence), orientation=:vertical, legend=false,
                                    xlims=(0, maximum(sequence)),normalize=:probability,xscale=:log10,yscale =:log10)  
    end

    annotation_text = string("Minimum sequence: ", minimum(sequence), "\n",
    "Maximum sequence: ", maximum(sequence), "\n",
    "Mean sequence: ", mean(sequence), "\n",
    "Number of bins: ", numOfbins, "\n",
    "Highlighted bin: ", highlight_bin, "\n",
    "Number of colored points: ", length(highlight_indices))
    annotate!(55,0.5,text(annotation_text, :blue, :left))


    point_colors = [i in highlight_indices ? color : :lightblue for i in 1:size(y, 1)]
    point_alphas = [i in highlight_indices ? 1 : 0.2 for i in 1:size(y, 1)]
    scatter_plot = plot_embedding(y,color = point_colors, title = "", alpha = point_alphas, size = (350,350))

    plot(scatter_plot, histogram_plot, layout=(2, 1), size=(800, 800))
end


#Author: Cody
#Date: 2024-1-28