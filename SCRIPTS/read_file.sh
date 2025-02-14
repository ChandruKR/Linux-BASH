#!/bin/bash

# Prompt the user for a filename
read -p "Enter the filename: " filename

# Check if the file exists
if [ -f "$filename" ]; then
    # Initialize line number counter
    line_number=1

    # Read the file line by line
    while IFS= read -r line; do
        # Print the line number and the line content
        echo "Line $line_number: $line"
        # Increment the line number
        ((line_number++))
    done < "$filename"
else
    # Display an error message and exit if the file does not exist
    echo "Error: File '$filename' does not exist."
    exit 1
fi

: << 'COMMENT' The while IFS= read -r line loop reads the file line by line.
IFS= ensures leading/trailing whitespace is preserved.
-r prevents backslashes from being interpreted as escape characters.
