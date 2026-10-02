#!/usr/bin/env bash
# Symlink dotfiles into $HOME. Existing non-symlink files are backed up to *.bak.
set -euo pipefail
DOTFILES="$(cd "$(dirname "$0")" && pwd)"

clone() {
  local repo="$1" dest="$2"
  if [[ -d "$dest" ]]; then
    echo "exists $dest"
  else
    git clone --depth=1 "$repo" "$dest"
  fi
}

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

# zsh dependencies the zshrc expects
ZSH_CUSTOM="$HOME/.oh-my-zsh/custom"
clone https://github.com/ohmyzsh/ohmyzsh.git                 "$HOME/.oh-my-zsh"
clone https://github.com/romkatv/powerlevel10k.git           "$ZSH_CUSTOM/themes/powerlevel10k"
clone https://github.com/zsh-users/zsh-autosuggestions.git   "$ZSH_CUSTOM/plugins/zsh-autosuggestions"
clone https://github.com/zsh-users/zsh-syntax-highlighting.git "$HOME/zsh-syntax-highlighting"

# tmux plugin manager
clone https://github.com/tmux-plugins/tpm.git                "$HOME/.tmux/plugins/tpm"

link zshrc         "$HOME/.zshrc"
link p10k.zsh        "$HOME/.p10k.zsh"
link tmux.conf       "$HOME/.tmux.conf"
link gitconfig       "$HOME/.gitconfig"
link gitignore_global "$HOME/.config/git/ignore"
link ghostty-config  "$HOME/.config/ghostty/config"
link bin/tmux-sessionizer "$HOME/.local/bin/tmux-sessionizer"
link bin/tmux-sysinfo     "$HOME/.local/bin/tmux-sysinfo"
link irssi           "$HOME/.irssi/config"

# Install tmux plugins listed in tmux.conf (needs the links above)
tmux new-session -ds tpm-install
tmux source-file "$HOME/.tmux.conf"
"$HOME/.tmux/plugins/tpm/bin/install_plugins" >/dev/null || echo "tmux plugins: run prefix+I inside tmux"
tmux kill-session -t tpm-install
