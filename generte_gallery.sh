#!/bin/bash

# Output HTML file
OUTPUT_HTML="README.md"

# Directory containing images
IMAGES_DIR="images"

# Header of the HTML gallery
echo "# GALLERY" > "$OUTPUT_HTML"
echo "" >> "$OUTPUT_HTML"
echo '<!DOCTYPE html>' >> "$OUTPUT_HTML"
echo '<html lang="en">' >> "$OUTPUT_HTML"
echo '<head>' >> "$OUTPUT_HTML"
echo '  <meta charset="UTF-8">' >> "$OUTPUT_HTML"
echo '  <meta name="viewport" content="width=device-width, initial-scale=1.0">' >> "$OUTPUT_HTML"
echo '  <style>' >> "$OUTPUT_HTML"
echo '    .gallery { display: grid; grid-template-columns: repeat(auto-fill, minmax(200px, 1fr)); gap: 10px; }' >> "$OUTPUT_HTML"
echo '    .thumbnail { width: 100%; height: auto; }' >> "$OUTPUT_HTML"
echo '  </style>' >> "$OUTPUT_HTML"
echo '</head>' >> "$OUTPUT_HTML"
echo '<body>' >> "$OUTPUT_HTML"
echo '' >> "$OUTPUT_HTML"
echo '<div class="gallery">' >> "$OUTPUT_HTML"

# Loop through each image in the images directory
for IMAGE in "$IMAGES_DIR"/*; do
    # Check if it's a file
    if [ -f "$IMAGE" ]; then
        # Get the filename
        FILENAME=$(basename "$IMAGE")
        # Add image to the HTML gallery
        echo '  <a href="'$IMAGE'" target="_blank">' >> "$OUTPUT_HTML"
        echo '    <img src="'$IMAGE'" alt="Thumbnail of '$FILENAME'" class="thumbnail">' >> "$OUTPUT_HTML"
        echo '  </a>' >> "$OUTPUT_HTML"
    fi
done

# Closing tags of the HTML gallery
echo '</div>' >> "$OUTPUT_HTML"
echo '' >> "$OUTPUT_HTML"
echo '</body>' >> "$OUTPUT_HTML"
echo '</html>' >> "$OUTPUT_HTML"
