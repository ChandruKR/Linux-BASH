#!/bin/bash
#
you_root() {
	if [ "$EUID" -ne 0 ]; then
		return 1
	else
		return 0
	fi
}

if you_root; then
	echo "You're root"
else
	echo "you are not root"
fi
