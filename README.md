# dotfiles

zsh (oh-my-zsh + powerlevel10k), tmux, git, Ghostty and irssi configs.

## Install

```sh
git clone <this repo> ~/dotfiles
~/dotfiles/install.sh
```

`install.sh` clones oh-my-zsh, powerlevel10k, zsh-autosuggestions and zsh-syntax-highlighting if missing, then symlinks each file into place and backs up any existing real file to `*.bak`. It is safe to re-run.

It also installs TPM and the tmux plugins (resurrect, continuum).

Machine-specific settings and secrets go in `~/.zshrc.local`, which is sourced if it exists and is not tracked.

## Dependencies

- zsh and git (the zsh plugins are installed by `install.sh`)
- [atuin](https://atuin.sh) for shell history (Debian: `apt install atuin`)
- [uv](https://docs.astral.sh/uv/) for Python
- fzf, eza, bat, fd (Debian: `apt install fzf eza bat fd-find`)
- neovim, tmux, fortune, cowsay, lolcat
- A Nerd Font for the p10k icons

## tmux keys (prefix is `Ctrl-a`)

| Keys | Action |
| --- | --- |
| `prefix f` | fzf project picker, opens/switches to a session (`bin/tmux-sessionizer`) |
| `prefix Ctrl-s` / `Ctrl-r` | save / restore sessions (auto-saved every 15 min, restored on start) |
| `prefix r` | reload config |
| `prefix I` / `U` | install / update plugins |

Sessionizer search roots default to `~/src` (depth 1) and `~/work` (depth 2); override in `~/.zshrc.local` with `TMUX_SESSIONIZER_PATHS="dir:depth ..."`.
