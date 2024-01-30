function hist_map(y::Matrix, sequence::Vector; scale = "linear-linear", color=:red, numOfbins = 10, highlight_bin = 1)
    embed_dim = size(y,2)
    widthOfbins = (maximum(sequence)-minimum(sequence))/numOfbins

    min = minimum(sequence)+ widthOfbins*(highlight_bin-1)
    max = minimum(sequence)+ widthOfbins*(highlight_bin)

    highlight_indices = findall(x -> x >= min && x <= max, sequence)

    if scale == "linear-linear"
        histogram_plot = histogram(vec(sequence),bins = minimum(sequence):widthOfbins:maximum(sequence), orientation=:vertical, legend=false,
                                    normalize=:probability,size=(400, 400))
    elseif scale == "log-linear"
        histogram_plot = histogram(vec(sequence),bins = minimum(sequence):widthOfbins:maximum(sequence), orientation=:vertical, legend=false,
                                    normalize=:probability,yscale=:log10)
    elseif scale == "linear-log"
        histogram_plot = histogram(vec(sequence),bins = minimum(sequence):widthOfbins:maximum(sequence), orientation=:vertical, legend=false,
                                    normalize=:probability,xscale=:log10)   
    elseif scale =="log-log"
        histogram_plot = histogram(vec(sequence),bins = minimum(sequence):widthOfbins:maximum(sequence), orientation=:vertical, legend=false,
                                   normalize=:probability,xscale=:log10,yscale =:log10)  
    end

    if embed_dim == 2
        point_colors = [i in highlight_indices ? color : :lightblue for i in 1:size(y, 1)]
        point_alphas = [i in highlight_indices ? 1 : 0.1 for i in 1:size(y, 1)]
        scatter_plot = plot_embed(y,color = point_colors, title = "", alpha = point_alphas)
    elseif embed_dim == 3
        point_colors = [i in highlight_indices ? color : :black for i in 1:size(y, 1)]
        point_alphas = [i in highlight_indices ? 1 : 0.1 for i in 1:size(y, 1)]
        scatter_plot = plot_embed(y,color = point_colors, title = "", alpha = point_alphas)
    end

    annotation_plot = plot(1, 1, color=:white, legend=false, ticks=false, border=:none)
    annotate!(annotation_plot, 0, 0.9, text("Number of points: $(length(sequence))", :blue, :left))
    annotate!(annotation_plot, 0, 0.8, text("Minimum: $(minimum(sequence))", :blue, :left))
    annotate!(annotation_plot, 0, 0.7, text("Maximum: $(maximum(sequence))", :blue, :left))
    annotate!(annotation_plot, 0, 0.6, text("Mean: $(mean(sequence))", :blue, :left))
    annotate!(annotation_plot, 0, 0.5, text("Number of Bins: $numOfbins", :blue, :left))
    annotate!(annotation_plot, 0, 0.4, text("Highlighted Bin: $highlight_bin", :blue, :left))
    annotate!(annotation_plot, 0, 0.3, text("Number of colored points: $(length(highlight_indices))", :blue, :left))
    annotate!(annotation_plot, 0, 0.2, text("Scale: $scale", :blue, :left))

    plot(scatter_plot, histogram_plot,annotation_plot,layout=(1,3), size=(1000, 500))
end


#Author: Cody
#Date: 2024-1-28