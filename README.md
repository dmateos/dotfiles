# dotfiles

zsh (oh-my-zsh + powerlevel10k), tmux, git, Ghostty and irssi configs.

## Install

```sh
git clone <this repo> ~/dotfiles
~/dotfiles/install.sh
```

`install.sh` symlinks each file into place and backs up any existing real file to `*.bak`.

Machine-specific settings and secrets go in `~/.zshrc.local`, which is sourced if it exists and is not tracked.

## Dependencies

- [oh-my-zsh](https://ohmyz.sh) with the custom theme/plugin
  [powerlevel10k](https://github.com/romkatv/powerlevel10k) and
  [zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions) in `~/.oh-my-zsh/custom/`
- [zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting) cloned to `~/zsh-syntax-highlighting`
- [uv](https://docs.astral.sh/uv/) for Python
- fzf, eza, bat, fd (Debian: `apt install fzf eza bat fd-find`)
- neovim, tmux, fortune, cowsay, lolcat
- A Nerd Font for the p10k icons
