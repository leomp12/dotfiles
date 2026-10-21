#!/bin/bash
# @vicinae.schemaVersion 1
# @vicinae.title Ask Claude
# @vicinae.description Open Claude Code in a floating kitty with the question
# @vicinae.icon 🤖
# @vicinae.mode silent
# @vicinae.argument1 { "type": "text", "placeholder": "question" }
# float-exec roda pelo Hyprland, então o kitty herda o ambiente da sessão (CLAUDE_CONFIG_DIR etc.), não o do service
exec "$HOME/.bin/float-exec" kitty --class claude -e claude -- "$1"
