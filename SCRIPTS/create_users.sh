#!/bin/bash

# Path to the CSV file
csv_file="users.csv"

# Check if the CSV file exists
if [ ! -f "$csv_file" ]; then
    echo "Error: CSV file '$csv_file' not found."
    exit 1
fi

# Read the CSV file line by line
while IFS=, read -r username password group; do
    echo "Processing user: $username"

    # Create the group if it doesn't exist
    if ! getent group "$group" > /dev/null; then
        echo "Creating group: $group"
        groupadd "$group"
        if [ $? -eq 0 ]; then
            echo "Group '$group' created successfully."
        else
            echo "Error: Failed to create group '$group'."
            continue
        fi
    else
        echo "Group '$group' already exists."
    fi

    # Create the user if they don't exist
    if ! id "$username" > /dev/null 2>&1; then
        echo "Creating user: $username"
        useradd -m -s /bin/bash -g "$group" "$username"
        if [ $? -eq 0 ]; then
            echo "User '$username' created successfully."
        else
            echo "Error: Failed to create user '$username'."
            continue
        fi
    else
        echo "User '$username' already exists."
    fi

    # Set the user's password
    echo "Setting password for user: $username"
    echo "$username:$password" | chpasswd
    if [ $? -eq 0 ]; then
        echo "Password for user '$username' set successfully."
    else
        echo "Error: Failed to set password for user '$username'."
    fi

    echo "----------------------------------------"
done < "$csv_file"

echo "User creation process completed."
