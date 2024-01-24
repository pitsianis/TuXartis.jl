using Plots

function plot_embedding(Y; color=:"blue", xlabel="", ylabel="",  title="Embedding Plot", marksize = 5,size = (700,700),alpha=0.5)
    """
    Create a scatter plot to visualize 2D embedding coordinates.

    # Arguments
    - `Y`: The embedding matrix with two columns representing X and Y coordinates.

    # Optional Keyword Arguments
    - `color`: Scatter plot color (default is :blue).
    - `xlabel`: X-axis label (default is an empty string, which results in no label).
    - `ylabel`: Y-axis label (default is an empty string, which results in no label).
    - `title`: Plot title (default is "Embedding Plot").
    - 'marksize': size of the point (default: 5)
    - 'size': size of the plot window (default: 700 *700)
    - 'alpha': transparency of points (default:0.5)
    """
    plot(scatter(Y[:, 1], Y[:, 2], label="", color=color, aspect_ratio=:equal,marksize =marksize, size = size,framestyle=:zerolines, alpha =alpha))
    
    if isempty(xlabel)
        xaxis!("") 
    else
        xlabel!(xlabel)
    end
    
    if isempty(ylabel)
        yaxis!("")  
    else
        ylabel!(ylabel)
    end
    
    title!(title)
end

#Author: Cody
#Date: 2023-1-13