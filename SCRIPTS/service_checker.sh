#!/bin/bash

# Check if a service name is provided as an argument
if [ -z "$1" ]; then
    echo "Error: Please provide a service name as an argument."
    exit 1
fi

service_name="$1"

# Check if the service is active
status=$(systemctl is-active "$service_name")

if [ "$status" = "active" ]; then
    echo "Service '$service_name' is running."
else
    echo "Service '$service_name' is inactive. Attempting to start it..."

    # Attempt to start the service
    sudo systemctl start "$service_name"

    # Check if the service started successfully
    if [ $? -eq 0 ]; then
        echo "Service '$service_name' started successfully."
    else
        echo "Error: Failed to start service '$service_name'."
        exit 1
    fi
fi
