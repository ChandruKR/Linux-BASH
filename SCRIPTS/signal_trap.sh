#!/bin/bash



# Defining  clear function
clear_up() {
    echo "Caught SIGINT, cleaning up!"
    #  removing temporary files, cleaning up
    if [ -f "/tmp/tempfile.txt" ]; then
        rm -f "/tmp/tempfile.txt"
        echo "Removed temporary file: /tmp/tempfile.txt"
    fi
    exit 1  # Exit the script with a non-zero status
}

# Set up the trap to call the cleanup function on SIGINT
trap clear_up SIGINT

# Create a temporary file for demonstration
touch /tmp/tempfile.txt
echo "Temporary file created: /tmp/tempfile.txt"

# Simulate a long-running process
echo "Running... Press CTRL+C to interrupt."
sleep 10

# Normal script completion
echo "Script completed successfully."
rm -f /tmp/tempfile.txt
exit 0
