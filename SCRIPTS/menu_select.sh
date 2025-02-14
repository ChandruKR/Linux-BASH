#!/bin/bash
#
#
#
while true; do
	echo "Please select an option:"
    # Present the menu using select
    select option in "Show Date and Times" "List Files" "Show Current User" "Exit"; do
        case $option in
            "Show Date and Times")
                echo "Current date and time: $(date)"
		echo "sdsdsds $option"
                break
                ;;
            "List Files")
                echo "Listing files in the current directory:"
                ls
                break
                ;;
            "Show Current User")
                echo "Current user: $(whoami)"
                break
                ;;
            "Exit")
                echo "Exiting the script. Goodbye!"
                exit 0
                ;;
            *)
                echo "Invalid option. Please try again."
                break
                ;;
        esac
    done
done
