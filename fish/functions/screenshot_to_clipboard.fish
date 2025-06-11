function screenshot_to_clipboard
    set screenshot_filename (echo "$HOME/Pictures/Screenshots/screenshot-$(date +"%Y-%m-%d--%H:%M:%S").png")
    grim -g (slurp) $screenshot_filename

    if [ -e $screenshot_filename ]
        cat $screenshot_filename | wl-copy --type image/png
        notify-send -i "$screenshot_filename" -t 2000 "Screenshots" "Screenshot was taken"
    end
end
