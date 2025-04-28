#!/bin/bash

# Directory containing the password-protected files
INPUT_DIR="./"
# Password for the archives
PASSWORD="infected"
# Output directory for extracted files
OUTPUT_DIR="./unziped/"

# Create the output directory if it doesn't exist
mkdir -p "$OUTPUT_DIR"

# Loop through all compressed files in the directory
for FILE in "$INPUT_DIR"/*; do
    if [[ -f "$FILE" ]]; then
        echo "Processing: $FILE"
        7z x "$FILE" -p"$PASSWORD" -o"$OUTPUT_DIR" -y
        if [[ $? -ne 0 ]]; then
            echo "Failed to extract $FILE"
        else
            echo "Successfully extracted $FILE"
        fi
    fi
done

echo "Extraction complete!"
