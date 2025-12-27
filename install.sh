#!/usr/bin/env bash
set -euo pipefail

TS="$(date +%Y%m%d_%H%M%S)"
BK="$HOME/.dotfiles_backup_$TS"

mkdir -p "$BK"

backup() {
  local p="$1"
  if [ -e "$p" ] || [ -L "$p" ]; then
    mkdir -p "$BK/$(dirname "${p#$HOME/}")"
    mv "$p" "$BK/${p#$HOME/}"
  fi
}

backup "$HOME/.bashrc"
backup "$HOME/.tmux.conf"
backup "$HOME/.config/nvim"

cp -a bash/bashrc "$HOME/.bashrc"
cp -a tmux/tmux.conf "$HOME/.tmux.conf"
mkdir -p "$HOME/.config"
cp -a nvim/nvim "$HOME/.config/nvim"

echo "OK. Backup: $BK"
