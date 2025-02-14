#!/bin/bash

# Check if two directory paths are provided
if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <directory1> <directory2>"
    exit 1
fi

dir1="$1"
dir2="$2"

# Check if the directories exist
if [ ! -d "$dir1" ]; then
    echo "Error: Directory '$dir1' does not exist."
    exit 1
fi

if [ ! -d "$dir2" ]; then
    echo "Error: Directory '$dir2' does not exist."
    exit 1
fi

# Create a log file with the current date
log_file="dir_diff_$(date +%Y%m%d).log"
echo "Comparing directories '$dir1' and '$dir2'" > "$log_file"
echo "----------------------------------------" >> "$log_file"

# Compare the directories recursively using diff -qr
diff_output=$(diff -qr "$dir1" "$dir2")

# Write the differences to the log file
if [ -z "$diff_output" ]; then
    echo "No differences found." >> "$log_file"
else
    echo "$diff_output" >> "$log_file"
fi

# Count the number of differences
diff_count=$(echo "$diff_output" | grep -c "^")

# Print a summary
echo "Differences found: $diff_count lines."
echo "Differences logged to '$log_file'."
