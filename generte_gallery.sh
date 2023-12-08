#!/bin/bash

# Output HTML file
OUTPUT_HTML="README.md"

# Directory containing images
IMAGES_DIR="images"

# Header of the HTML gallery
echo "# GALLERY" > "$OUTPUT_HTML"
echo "" >> "$OUTPUT_HTML"
echo '```html' >> "$OUTPUT_HTML"
echo '<!DOCTYPE html>' >> "$OUTPUT_HTML"
echo '<html lang="en">' >> "$OUTPUT_HTML"
echo '<head>' >> "$OUTPUT_HTML"
echo '  <meta charset="UTF-8">' >> "$OUTPUT_HTML"
echo '  <meta name="viewport" content="width=device-width, initial-scale=1.0">' >> "$OUTPUT_HTML"
echo '  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/lightgallery@1.10.0/dist/css/lightgallery.min.css">' >> "$OUTPUT_HTML"
echo '  <script src="https://cdn.jsdelivr.net/npm/lightgallery@1.10.0/dist/js/lightgallery.min.js"></script>' >> "$OUTPUT_HTML"
echo '</head>' >> "$OUTPUT_HTML"
echo '<body>' >> "$OUTPUT_HTML"
echo '' >> "$OUTPUT_HTML"
echo '<div id="lightgallery">' >> "$OUTPUT_HTML"

# Loop through each image in the images directory
for IMAGE in "$IMAGES_DIR"/*; do
    # Check if it's a file
    if [ -f "$IMAGE" ]; then
        # Get the filename
        FILENAME=$(basename "$IMAGE")
        # Add image to the HTML gallery
        echo '  <a href="'$IMAGE'" data-lg-size="1600-1200" data-thumbnail="'$IMAGE'">' >> "$OUTPUT_HTML"
        echo '    <img src="'$IMAGE'" alt="Image Description">' >> "$OUTPUT_HTML"
        echo '  </a>' >> "$OUTPUT_HTML"
        echo '' >> "$OUTPUT_HTML"
    fi
done

# Closing tags of the HTML gallery
echo '</div>' >> "$OUTPUT_HTML"
echo '' >> "$OUTPUT_HTML"
echo '<script>' >> "$OUTPUT_HTML"
echo '  document.addEventListener("DOMContentLoaded", function () {' >> "$OUTPUT_HTML"
echo '    lightGallery(document.getElementById("lightgallery"), {' >> "$OUTPUT_HTML"
echo '      thumbnail: true,' >> "$OUTPUT_HTML"
echo '      animateThumb: false,' >> "$OUTPUT_HTML"
echo '    });' >> "$OUTPUT_HTML"
echo '  });' >> "$OUTPUT_HTML"
echo '</script>' >> "$OUTPUT_HTML"
echo '' >> "$OUTPUT_HTML"
echo '</body>' >> "$OUTPUT_HTML"
echo '</html>' >> "$OUTPUT_HTML"
echo '```' >> "$OUTPUT_HTML"
