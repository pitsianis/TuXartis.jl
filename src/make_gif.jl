using Plots
plotlyjs()

function make_gif(plot, filename="rotation.gif", n_frames=36)
    frame_files = []

    for i = 1:n_frames
        # Calculate the camera angle
        angle = 360 * (i / n_frames)

        # Adjust camera angle
        plot.camera = (angle, 30)  # 30 degrees elevation can be adjusted as needed

        # Save each frame
        frame_filename = "frame_$(i).png"
        savefig(plot, frame_filename)
        push!(frame_files, frame_filename)
    end

    # Correctly interpolate the filenames and the output filename
    run(`convert -delay 20 -loop 0 $(frame_files...) $filename`)

    # Clean up frame files
    for file in frame_files
        rm(file)
    end
    
    display("image/gif", open(read, filename))
end
