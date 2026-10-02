# dotfiles

zsh (oh-my-zsh + powerlevel10k), tmux, git, Ghostty and irssi configs.

## Install

```sh
git clone <this repo> ~/dotfiles
~/dotfiles/install.sh
```

`install.sh` clones oh-my-zsh, powerlevel10k, zsh-autosuggestions and zsh-syntax-highlighting if missing, then symlinks each file into place and backs up any existing real file to `*.bak`. It is safe to re-run.

Machine-specific settings and secrets go in `~/.zshrc.local`, which is sourced if it exists and is not tracked.

## Dependencies

- zsh and git (the zsh plugins are installed by `install.sh`)
- [uv](https://docs.astral.sh/uv/) for Python
- fzf, eza, bat, fd (Debian: `apt install fzf eza bat fd-find`)
- neovim, tmux, fortune, cowsay, lolcat
- A Nerd Font for the p10k icons
