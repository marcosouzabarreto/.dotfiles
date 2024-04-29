#!/bin/bash

# Paths to the kitty configuration
KITTY_CONFIG="$HOME/.config/kitty/kitty.conf"
# Backup original config if not already backed up
[ ! -f "$KITTY_CONFIG.orig" ] && cp "$KITTY_CONFIG" "$KITTY_CONFIG.orig"

# Detect if DP-0 or DP-2 is connected
DP0_STATUS=$(xrandr | grep 'DP-0' | grep ' connected')
DP2_STATUS=$(xrandr | grep 'DP-2' | grep ' connected')

if [ ! -z "$DP0_STATUS" ]; then
    # If DP-0 is connected, set it to 165Hz and disable the laptop screen
    xrandr --output DP-0 --mode 1920x1080 --rate 165
    xrandr --output DP-4 --off
    sed -i '/font_size/c\font_size 14.0' "$KITTY_CONFIG"
elif [ ! -z "$DP2_STATUS" ]; then
    # If DP-2 is connected, set it to 165Hz and disable the laptop screen
    xrandr --output DP-2 --mode 1920x1080 --rate 165
    xrandr --output DP-4 --off
    sed -i '/font_size/c\font_size 14.0' "$KITTY_CONFIG"
else
    # If no external monitors are connected, set the laptop screen to 240Hz
    xrandr --output DP-4 --auto --rate 240 --primary
    sed -i '/font_size/c\font_size 16.0' "$KITTY_CONFIG"
fi

# Reload kitty configuration if kitty is running
if pgrep -x "kitty" > /dev/null; then
    kitty @ set-font-size --all --configured
fi

feh --bg-fill /home/marco_arch/Pictures/.wallpaper.png
