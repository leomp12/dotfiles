#!/bin/bash
# @vicinae.schemaVersion 1
# @vicinae.title Claude Code in Folder
# @vicinae.description Open a Claude Code session in the folder zoxide finds (e.g. "dotfiles")
# @vicinae.icon 🤖
# @vicinae.mode silent
# @vicinae.argument1 { "type": "text", "placeholder": "folder" }
q="${1:-}"
[ -n "$q" ] || exec "$HOME/.bin/claude-here" "$HOME"   # sem pasta: abre na home, como era o SUPER+A
dir="${q/#\~/$HOME}"
if [ ! -d "$dir" ]; then
  # zoxide primeiro (frecência); senão o primeiro repo em ~/code com o nome parecido
  read -ra kw <<<"$q"   # palavras viram termos do zoxide (sem expandir glob)
  dir=$(zoxide query -- "${kw[@]}" 2>/dev/null) ||
    dir=$(ls -d "$HOME"/code/*/*/ 2>/dev/null | grep -i -- "$q" | head -1) || true
fi
[ -n "$dir" ] && [ -d "$dir" ] || { notify-send -i dialog-error "Claude Code" "No folder matches \"$q\""; exit 1; }
exec "$HOME/.bin/claude-here" "$dir"
