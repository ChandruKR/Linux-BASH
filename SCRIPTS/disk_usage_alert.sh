#!/bin/bash

read -p "ENter the filesystem name to check:" filesystem
# Get the disk usage percentage for the root filesystem (/)
usage=$(df $filesystem | awk 'NR==2 {print $5}' | sed 's/%//')

# Check if usage is above 80%
if [ "$usage" -gt 80 ]; then
    echo "Disk usage critical: $usage% used."
else
    echo "Disk usage is normal: $usage% used."
fi
