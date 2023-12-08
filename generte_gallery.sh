#!/bin/bash

OUTPUT_HTML="README.md"

IMAGES_DIR="images"
THUMBS_DIR="thumbs"

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

for IMAGE in "$IMAGES_DIR"/*; do
    # Check if it's a file
    if [ -f "$IMAGE" ]; then
        # Get the filename
        FILENAME=$(basename "$IMAGE")
        # Extract the image name without extension
        IMAGE_NAME="${FILENAME%.*}"
        # Thumbnail path
        THUMB_PATH="$THUMBS_DIR/$FILENAME"
        # Add image to the HTML gallery
        echo "  <a href=\"$IMAGE\" target=\"_blank\">" >> "$OUTPUT_HTML"
        echo "    <img src=\"$THUMB_PATH\" alt=\"Thumbnail of $FILENAME\" class=\"thumbnail\">" >> "$OUTPUT_HTML"
        echo "  </a>" >> "$OUTPUT_HTML"
    fi
done

echo '</div>' >> "$OUTPUT_HTML"
echo '' >> "$OUTPUT_HTML"
echo '</body>' >> "$OUTPUT_HTML"
echo '</html>' >> "$OUTPUT_HTML"
