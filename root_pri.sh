#!/bin/bash

#if ! [ $(id -u) = 0 ]; then
#    echo "You're not root! SWITCH to root to run this script"
#exit 1
#fi

### Better one IF statmenet:

if [ ${EUID:-0} -ne 0 ] || [ "$(id -u)" -ne 0 ]; then
    echo You are not root.
else
    echo Hello, You are now root. SUPERUSER
fi

