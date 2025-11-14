#!/bin/bash
# Download api keys (kaggle.json) to ~/.kaggle/kaggle.json before running this script.

ZIP_FILE="aviation-accident-ntsb.zip"
URL="https://www.kaggle.com/api/v1/datasets/download/yassereleraky/aviation-accident-ntsb"

# Check if zip file already exists
if [ -f "$ZIP_FILE" ]; then
    echo "File $ZIP_FILE already exists."
    read -p "Do you want to overwrite it? (y/N): " -n 1 -r
    echo
    if [[ ! $REPLY =~ ^[Yy]$ ]]; then
        echo "Skipping download."
    else
        echo "Downloading $ZIP_FILE..."
        curl -L -o "$ZIP_FILE" "$URL"
    fi
else
    echo "Downloading $ZIP_FILE..."
    curl -L -o "$ZIP_FILE" "$URL"
fi

# Check if extraction is needed
if [ -f "$ZIP_FILE" ]; then
    unzip "$ZIP_FILE"
else
    echo "No zip file found to extract."
fi
