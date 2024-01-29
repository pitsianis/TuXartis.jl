using Plots
plotlyjs()

# Function to rotate 3D points around the Z-axis
function rotate_3d_points(Y, angle)
    R = [cos(angle) -sin(angle) 0; sin(angle) cos(angle) 0; 0 0 1]
    return Y * R'  # Rotate the points
end

# Replace these with your actual 3D data matrices Y1 and Y2
Y1 = Y_v
Y2 = Y_e

# Insert your specific coloring criteria here
# Assuming feature_filter, left_indices, right_indices are calculated elsewhere in your code
# Update these lines with the actual calculations from your function
B = Graphs.incidence_matrix(G)
sequence = "vertex degree"
large2small = false
indices = [10]
feature_filter = select_filter(G, sequence)
left_indices = sortperm(feature_filter, rev = large2small)[indices]
right_indices = v_to_e(B, left_indices)

n_frames = 10  # Adjusted number of frames for slower rotation

anim = @animate for i ∈ 1:n_frames
    angle = 2π * (i / n_frames)

    # Rotate both datasets
    rotated_Y1 = rotate_3d_points(Y1, angle)
    rotated_Y2 = rotate_3d_points(Y2, angle)

    # Apply coloring based on indices
    left_colors = [i in left_indices ? :red : :black for i in 1:size(rotated_Y1, 1)]
    right_colors = [i in right_indices ? :blue : :black for i in 1:size(rotated_Y2, 1)]

    # Create subplots with colored data
    p1 = scatter(rotated_Y1[:, 1], rotated_Y1[:, 2], rotated_Y1[:, 3], color=left_colors, alpha=0.5, legend=false, title="Y1")
    p2 = scatter(rotated_Y2[:, 1], rotated_Y2[:, 2], rotated_Y2[:, 3], color=right_colors, alpha=0.5, legend=false, title="Y2")

    # Combine subplots into one plot
    plot(p1, p2, layout=(1, 2))
end

# Save the animation as a GIF with adjusted fps
gif(anim, "third.gif", fps = 1)  # Decreased fps for slower rotation