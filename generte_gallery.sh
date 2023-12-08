#!/bin/bash

# Output SVG file
OUTPUT_SVG="gallery.svg"

# Directory containing images
IMAGES_DIR="images"

# Header of the SVG gallery
echo '<svg fill="none" viewBox="0 0 800 400" width="800" height="400" xmlns="http://www.w3.org/2000/svg">' > "$OUTPUT_SVG"
echo '  <foreignObject width="100%" height="100%">' >> "$OUTPUT_SVG"
echo '    <div xmlns="http://www.w3.org/1999/xhtml">' >> "$OUTPUT_SVG"

# CSS Styles
echo '      <style>' >> "$OUTPUT_SVG"
echo '        .gallery { display: grid; grid-template-columns: repeat(auto-fill, minmax(200px, 1fr)); gap: 10px; }' >> "$OUTPUT_SVG"
echo '        .thumbnail { width: 100%; height: auto; }' >> "$OUTPUT_SVG"
echo '      </style>' >> "$OUTPUT_SVG"

# Opening tag for the gallery
echo '      <div class="gallery">' >> "$OUTPUT_SVG"

# Loop through each image in the images directory
for IMAGE in "$IMAGES_DIR"/*; do
    # Check if it's a file
    if [ -f "$IMAGE" ]; then
        # Get the filename
        FILENAME=$(basename "$IMAGE")
        # Add image to the SVG gallery
        echo '        <a href="'$IMAGE'" target="_blank">' >> "$OUTPUT_SVG"
        echo '          <img src="'$IMAGE'" alt="Thumbnail of '$FILENAME'" class="thumbnail">' >> "$OUTPUT_SVG"
        echo '        </a>' >> "$OUTPUT_SVG"
    fi
done

# Closing tags for the gallery and SVG
echo '      </div>' >> "$OUTPUT_SVG"
echo '    </div>' >> "$OUTPUT_SVG"
echo '  </foreignObject>' >> "$OUTPUT_SVG"
echo '</svg>' >> "$OUTPUT_SVG"
