#!/bin/bash

# Check if the --bash-only option is provided
bash_only=false
if [ "$1" == "--bash-only" ]; then
    bash_only=true
fi

# Print the table header
printf "%-20s %-20s\n" "Username" "Default Shell"
echo "----------------------------------------"

# Process /etc/passwd using awk
awk -F: -v bash_only="$bash_only" '
{
    username = $1
    shell = $7
    if (bash_only == "true" && shell != "/bin/bash") {
        next
    }
    printf "%-20s %-20s\n", username, shell
}
' /etc/passwd
