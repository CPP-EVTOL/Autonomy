#!/bin/bash

# Check if a filename was provided
if [ "$#" -ne 1 ]; then
    echo "Usage: $0 filename"
    exit 1
fi

# Assign the first argument to a variable
FILE="$1"

# Check if the file exists
if [ -e "$FILE" ]; then
    chmod +x "$FILE"
    echo "Made '$FILE' executable."
else
    echo "Error: File '$FILE' does not exist."
    exit 1
fi