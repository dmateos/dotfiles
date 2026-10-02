#!/usr/bin/env bash
# Symlink dotfiles into $HOME. Existing non-symlink files are backed up to *.bak.
set -euo pipefail
DOTFILES="$(cd "$(dirname "$0")" && pwd)"

link() {
  local src="$DOTFILES/$1" dest="$2"
  mkdir -p "$(dirname "$dest")"
  if [[ -e "$dest" && ! -L "$dest" ]]; then
    mv "$dest" "$dest.bak"
    echo "backed up $dest -> $dest.bak"
  fi
  ln -sfn "$src" "$dest"
  echo "linked $dest -> $src"
}

link zshrc           "$HOME/.zshrc"
link p10k.zsh        "$HOME/.p10k.zsh"
link tmux.conf       "$HOME/.tmux.conf"
link gitconfig       "$HOME/.gitconfig"
link gitignore_global "$HOME/.config/git/ignore"
link ghostty-config  "$HOME/.config/ghostty/config"
link irssi           "$HOME/.irssi/config"
