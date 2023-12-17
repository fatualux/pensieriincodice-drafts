#!/bin/bash

# Choose a title for the gallery
TITLE=$(zenity --entry --title="Gallery Title" --text="Enter the title for the gallery:")

# Choose a directory for thumbnails
THUMBS_DIR_FULL=$(zenity --file-selection --directory --title="Select Thumbs Directory")
THUMBS_DIR=$(basename "$THUMBS_DIR_FULL")

# Choose a directory for images
IMAGES_DIR_FULL=$(zenity --file-selection --directory --title="Select Images Directory")
IMAGES_DIR=$(basename "$IMAGES_DIR_FULL")

OUTPUT_HTML="${TITLE}.html"
CSS_FILE="../style.css"

write_gallery() {

if [ ! -f "$CSS_FILE" ]; then
    echo '  .gallery { display: grid; grid-template-columns: repeat(auto-fill, minmax(200px, 1fr)); gap: 10px; }' >> "$CSS_FILE"
    echo '  .thumbnail { width: 100%; height: auto; }' >> "$CSS_FILE"
fi

echo "##$TITLE" > "$OUTPUT_HTML"
echo "" >> "$OUTPUT_HTML"
echo "<div class=\"gallery\">" >> "$OUTPUT_HTML"

for THUMB in "$THUMBS_DIR_FULL"/*; do
    if [ -f "$THUMB" ]; then
        FILENAME=$(basename "$THUMB")
        IMAGE_NAME="${FILENAME%.*}"
        IMAGE_PATH=$(find "$IMAGES_DIR_FULL" -type f -iname "$IMAGE_NAME.*" -print -quit)
        RELATIVE_IMAGE_PATH="images/${FILENAME}"
        RELATIVE_THUMB_PATH="thumbs/${FILENAME}"
        echo "  <a href=\"$RELATIVE_IMAGE_PATH\"><img class=\"thumbnail\" src=\"$RELATIVE_THUMB_PATH\" alt=\"$IMAGE_NAME\"></a>" >> "$OUTPUT_HTML"
    fi
done

echo '</div>' >> "$OUTPUT_HTML"
echo '</body>' >> "$OUTPUT_HTML"
echo '</html>' >> "$OUTPUT_HTML"

zenity --info --title="Script Finished" --text="Gallery $TITLE generated successfully."
}

clipboard() {
  local output_html="$1"
  cat "$output_html" | wl-copy --type text/html
  rm "$output_html"
}

write_gallery
clipboard "$OUTPUT_HTML"
