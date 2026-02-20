#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Make Fulltext Feed URL
# @raycast.mode silent
# @raycast.icon 🌐
# @raycast.description Wrap clipboard URL for FiveFilters full-text feed (sanitize input)

STR1="https://fivefilters.public.jonathangross.de/makefulltextfeed.php?url="
STR2="&max=20"

CLIP=$(pbpaste | tr -d '\n')

# Remove trailing slash if present
CLIP="${CLIP%/}"

RESULT="${STR1}${CLIP}${STR2}"

echo -n "$RESULT" | pbcopy
