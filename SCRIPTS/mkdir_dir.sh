#!/bin/bash
#

dir=$1

if [ -d "$1" ]; then
	echo Dir already exists, Use a different name
else
	mkdir -p $1
#	chmod u+rwx,g-x,o-x $1
	chmod 755 $1
fi
