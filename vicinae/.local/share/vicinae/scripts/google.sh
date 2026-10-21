#!/bin/bash
# @vicinae.schemaVersion 1
# @vicinae.title Search Google
# @vicinae.description Search in the default browser
# @vicinae.icon 🔎
# @vicinae.mode silent
# @vicinae.argument1 { "type": "text", "placeholder": "query" }
exec xdg-open "https://www.google.com/search?q=$(jq -rn --arg q "$1" '$q|@uri')"
