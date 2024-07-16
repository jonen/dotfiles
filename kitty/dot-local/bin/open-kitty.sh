#!/bin/bash

# Check if kitty is already running
if osascript -e 'tell application "System Events" to count (every process whose name is "kitty")' > /dev/null
then
    # create new window
    echo "Creating new window"
    open -a kitty -n
else
    # start kitty
    echo "Starting kitty"
    open -a kitty
fi
