#!/bin/bash
#
#
#

while true; do

echo "Choose your options"
echo "[S] Start"
echo "[R] Restart"
echo "[Q] Quit"

#take inputs
read -p "Enter your CHoice: " choice

#convert smaller to upper
choice=$(echo "$choice" | tr '[:lower:]' '[:upper:]')

#Use a case statement to handle the choices
case "$choice" in
	S)
		echo "Starting the service"
		break
		;;
	R)
		echo "Restarting the service"
		break
		;;
	Q)
		echo "Exiting...."
		exit 0
		;;
	*)
		echo "Invalid choice. Please try again"
		;;
esac
done

