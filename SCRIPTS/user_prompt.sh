#!/bin/bash

# CSV file to store user information
csv_file="users_info.csv"

# Function to validate name (non-empty string)
validate_name() {
    if [[ -z "$1" ]]; then
        echo "Error: Name cannot be empty. Please try again."
        return 1
    fi
    return 0
}

# Function to validate age (positive integer)
validate_age() {
    if [[ ! "$1" =~ ^[0-9]+$ ]] || [ "$1" -lt 1 ]; then
        echo "Error: Age must be a positive integer. Please try again."
        return 1
    fi
    return 0
}

# Function to validate email (basic pattern check)
validate_email() {
    local email_pattern="^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$"
    if [[ ! "$1" =~ $email_pattern ]]; then
        echo "Error: Invalid email format. Please try again."
        return 1
    fi
    return 0
}

# Prompt for name
while true; do
    read -p "Enter your name: " name
    if validate_name "$name"; then
        break
    fi
done

# Prompt for age
while true; do
    read -p "Enter your age: " age
    if validate_age "$age"; then
        break
    fi
done

# Prompt for email
while true; do
    read -p "Enter your email: " email
    if validate_email "$email"; then
        break
    fi
done

# Append the validated data to the CSV file
echo "$name,$age,$email" >> "$csv_file"
echo "Your information has been saved to $csv_file."
