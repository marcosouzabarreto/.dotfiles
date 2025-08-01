#!/bin/sh

# Give the system a moment to initialize displays
sleep 1

# Add the custom mode.
# IMPORTANT: Replace the numbers below with the ones from YOUR cvt output!
wlr-randr --output HDMI-A-1 --add-mode "1920x1080_165.00 525.00  1920 2088 2296 2672  1080 1083 1088 1192 -hsync +vsync"

# Apply the new mode.
wlr-randr --output HDMI-A-1 --mode "1920x1080_165.00"
