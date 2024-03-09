#!/bin/bash


if [ "$#" -eq 2 ] && [ "$1" == "-d" ] && [ -d $2 ]
then
        echo "Disk usage is our directory"
        sudo du -h --max-depth=1 "$2" | sort -rh | head

fi

if [ "$#" -eq 2 ] && [ "$1" == "-n" ]
then
        n=8
        directory="$2"
        echo "The top $n entries by default base in disk usage"
        sudo du -h --max-depth=1 "$directory" | sort -rh | head -n "$n"

elif [ "$#" -eq 3 ] && [ "$1" == "-n" ] && [ "$2" -gt 0 ]
then
        n="$2"
        directory="$3"
        echo "The top $n write disk usage:"
        sudo du --max-depth=1 "$directory" | sort -rh | head -n "$n"
fi
