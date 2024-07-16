#!/bin/bash

# Check if kitty is already running
if ps aux | grep -i wezterm-gui | grep -v grep > /dev/null
then
    # create new window
    echo "Creating new window"
    osascript -e 'tell application "WezTerm" to activate' -e 'tell application "System Events" to keystroke "n" using command down'
else
    # start kitty
    echo "Starting WezTerm"
    open -a WezTerm
fi
