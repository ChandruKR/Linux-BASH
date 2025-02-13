#!/bin/bash

# Thresholds
CPU_THRESHOLD=80       # CPU usage threshold in percentage
MEMORY_THRESHOLD=200   # Available memory threshold in MB

# Get CPU usage (using `top` command) || Extracts the idle CPU percentage from the CPU line
CPU_USAGE=$(top -bn1 | grep "Cpu(s)" | sed "s/.*, *\([0-9.]*\)%* id.*/\1/" | awk '{print 100 - $1}')
#
#####  #MUltiple ways to extract idle CPU percentage#######
#vmstat 1 2 | tail -1 | awk '{print $15}'
#mpstat 1 1 | awk '/Average:/ {print $12}'
#sar 1 1 | awk '/Average:/ {print $8}'
#top -bn1 | grep "Cpu(s)" | awk -F',' '{print $4}' | awk '{print $1}'

# Get memory usage (using `vmstat` command)
MEMORY_USAGE=$(vmstat -s | grep "free memory" | awk '{print $1}')
MEMORY_USAGE_MB=$((MEMORY_USAGE / 1024))  # Convert from KB to MB

# Print system resource information
echo "Current CPU Usage: $CPU_USAGE%"
echo "Available Memory: $MEMORY_USAGE_MB MB"

# Check CPU usage
if (( $(echo "$CPU_USAGE > $CPU_THRESHOLD" | bc -l) )); then
    echo "WARNING: CPU usage is above $CPU_THRESHOLD%!"
else
    echo "CPU usage is normal."
fi

# Check available memory
if (( $MEMORY_USAGE_MB < $MEMORY_THRESHOLD )); then
    echo "WARNING: Available memory is below $MEMORY_THRESHOLD MB!"
else
    echo "Memory usage is normal."
fi

# Final status
if (( $(echo "$CPU_USAGE <= $CPU_THRESHOLD" | bc -l) )) && (( $MEMORY_USAGE_MB >= $MEMORY_THRESHOLD )); then
    echo "System resources are normal."
fi
