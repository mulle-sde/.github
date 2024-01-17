#!/bin/bash

# Path to the input GIF file
INPUT="terminal.gif"

# Output directory for the frames
OUTPUT_DIR="frames"
mkdir -p $OUTPUT_DIR

# Get frame delays
DELAYS=$(identify -format '%T\n' $INPUT | awk '{printf "%d;%s\n", $1, "'$OUTPUT_DIR'/frame" NR ".png"}')

# Write frame delays to a CSV file
echo "$DELAYS" > $OUTPUT_DIR/delays.csv

# Extract frames
convert $INPUT -coalesce -adjoin $OUTPUT_DIR/frame%02d.png

