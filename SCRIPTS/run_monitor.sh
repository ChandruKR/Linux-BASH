#!/bin/bash

# Log file
log_file="monitor.log"

# Clear the log file if it exists
> "$log_file"

# Run the monitoring command and write output to console and log file
echo "Starting monitoring..." | tee -a "$log_file"
ping -c 4 google.com | tee -a "$log_file"

# Print final message
echo "Monitoring complete. Check $log_file."
