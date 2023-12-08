#!/bin/bash

OUTPUT_HTML="README.md"
CSS_FILE="style.css"

IMAGES_DIR="images"
THUMBS_DIR="thumbs"

if [ ! -f "$CSS_FILE" ]; then
    echo '  .gallery { display: grid; grid-template-columns: repeat(auto-fill, minmax(200px, 1fr)); gap: 10px; }' > "$CSS_FILE"
    echo '  .thumbnail { width: 100%; height: auto; }' >> "$CSS_FILE"
fi

echo '<div class="gallery">' >> "$OUTPUT_HTML"

for THUMB in "$THUMBS_DIR"/*; do
    if [ -f "$THUMB" ]; then
        FILENAME=$(basename "$THUMB")
        IMAGE_NAME="${FILENAME%.*}"
        IMAGE_PATH=$(find "$IMAGES_DIR" -type f -iname "$IMAGE_NAME.*" -print -quit)
        echo "  <a href=\"$IMAGE_PATH\"><img class=\"thumbnail\" src=\"$THUMB\" alt=\"$IMAGE_NAME\"></a>" >> "$OUTPUT_HTML"
    fi
done

echo '</div>' >> "$OUTPUT_HTML"
echo '</body>' >> "$OUTPUT_HTML"
echo '</html>' >> "$OUTPUT_HTML"
