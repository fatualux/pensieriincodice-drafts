#!/bin/bash

OUTPUT_HTML="README.md"
CSS_FILE="style.css"

IMAGES_DIR="images"
THUMBS_DIR="thumbs"

# Create the CSS file
echo '  .gallery { display: grid; grid-template-columns: repeat(auto-fill, minmax(200px, 1fr)); gap: 10px; }' > "$CSS_FILE"
echo '  .thumbnail { width: 100%; height: auto; }' >> "$CSS_FILE"

# Create the HTML file
echo "# GALLERY" > "$OUTPUT_HTML"
echo "" >> "$OUTPUT_HTML"
echo '<!DOCTYPE html>' >> "$OUTPUT_HTML"
echo '<html lang="en">' >> "$OUTPUT_HTML"
echo '<head>' >> "$OUTPUT_HTML"
echo '  <meta charset="UTF-8">' >> "$OUTPUT_HTML"
echo '  <meta name="viewport" content="width=device-width, initial-scale=1.0">' >> "$OUTPUT_HTML"
echo "  <link rel=\"stylesheet\" type=\"text/css\" href=\"$CSS_FILE\">" >> "$OUTPUT_HTML"
echo '</head>' >> "$OUTPUT_HTML"
echo '<body>' >> "$OUTPUT_HTML"
echo '' >> "$OUTPUT_HTML"
echo '<div class="gallery">' >> "$OUTPUT_HTML"

# Add thumbnails to the gallery
for THUMB in "$THUMBS_DIR"/*; do
    # Check if it's a file
    if [ -f "$THUMB" ]; then
        # Get the filename
        FILENAME=$(basename "$THUMB")
        # Extract the image name without extension
        IMAGE_NAME="${FILENAME%.*}"
        # Original image path with automatic extension detection
        IMAGE_PATH="$IMAGES_DIR/$IMAGE_NAME.$(file -b --extension "$IMAGES_DIR/$IMAGE_NAME" | tr '[:upper:]' '[:lower:]')"
        # Add thumbnail link to the list
        echo "  <a href=\"$IMAGE_PATH\"><img class=\"thumbnail\" src=\"$THUMB\" alt=\"$IMAGE_NAME\"></a>" >> "$OUTPUT_HTML"
    fi
done

echo '</div>' >> "$OUTPUT_HTML"
echo '</body>' >> "$OUTPUT_HTML"
echo '</html>' >> "$OUTPUT_HTML"
