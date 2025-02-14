#!/bin/bash

# Check if an input file is provided
if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <input_file>"
    exit 1
fi

input_file="$1"

# Check if the input file exists
if [ ! -f "$input_file" ]; then
    echo "Error: Input file '$input_file' does not exist."
    exit 1
fi

# Sort the file alphabetically (case-insensitive) and remove duplicates
sort -f "$input_file" | uniq > sorted_unique.txt

#OR
#sort -uf "$input_file"  > sorted_unique.txt

echo "File sorted and duplicates removed. Result saved to 'sorted_unique.txt'."
