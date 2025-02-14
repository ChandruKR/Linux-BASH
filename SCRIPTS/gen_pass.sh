#!/bin/bash

# Default password length
length=12

# Character sets
alphanumeric="A-Za-z0-9"
special_chars="!@#$%"

# Check for arguments
if [ "$#" -gt 0 ]; then
    # Check if the first argument is a number
    if [[ "$1" =~ ^[0-9]+$ ]]; then
        length="$1"
        shift
    fi

    # Check for --special flag
    if [[ "$1" == "--special" ]]; then
        use_special=true
    fi
fi

# Define the character set
charset="$alphanumeric"
if [ "$use_special" = true ]; then
    charset="$charset$special_chars"
fi

# Generate the password
password=$(head -c "$length" /dev/urandom | tr -dc "$charset" | head -c "$length")

# Print the password
echo "Generated password: $password"
