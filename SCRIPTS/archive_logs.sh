#!/bin/bash

# Target log directory
LOG_DIR="/var/log"

# Find .log files older than 7 days
OLD_LOGS=$(find "$LOG_DIR" -name "*.log" -type f -mtime +7)

# Check if any old logs were found
if [ -z "$OLD_LOGS" ]; then
    echo "No .log files older than 7 days found in $LOG_DIR."
    exit 0
fi

# Create archive filename with current date
ARCHIVE_NAME="old_logs_$(date +%Y%m%d).tar.gz"

# Archive the old logs
echo "Archiving old logs..."
tar -czf "/var/log/$ARCHIVE_NAME" $OLD_LOGS

# Check if the archive was successful
if [ $? -eq 0 ]; then
    echo "Archive created successfully: $ARCHIVE_NAME"

    # Remove the original logs
    echo "Removing original logs..."
    rm -f $OLD_LOGS

    # Check if the logs were removed successfully
    if [ $? -eq 0 ]; then
        echo "Original logs removed successfully."
    else
        echo "Error: Failed to remove original logs."
        exit 1
    fi
else
    echo "Error: Failed to create archive."
    exit 1
fi

echo "Log archiving and cleanup completed successfully."
