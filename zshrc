(( $+commands[fortune] && $+commands[cowsay] && $+commands[lolcat] )) && fortune | cowsay -f ~/dotfiles/bong.cow | lolcat

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Keep $PATH entries unique
typeset -U path

path=($HOME/.local/bin $path)
case `uname` in
  Darwin)
    path=(
      /opt/homebrew/bin
      /opt/homebrew/opt/openjdk/bin
      /opt/homebrew/opt/libpq/bin
      /usr/local/share/dotnet/sdk
      $path
    )
  ;;
esac
[[ -f $HOME/.cargo/env ]] && . "$HOME/.cargo/env"

# oh-my-zsh
export ZSH=$HOME/.oh-my-zsh
ZSH_DISABLE_COMPFIX="true"
ZSH_THEME="powerlevel10k/powerlevel10k"
plugins=(git ssh-agent aws zsh-autosuggestions)
source $ZSH/oh-my-zsh.sh

# History
HISTSIZE=999999999
SAVEHIST=$HISTSIZE
setopt SHARE_HISTORY EXTENDED_HISTORY HIST_IGNORE_ALL_DUPS HIST_REDUCE_BLANKS

export EDITOR=nvim
export VISUAL=nvim
alias vim=nvim

# Debian ships bat and fd under different names
(( $+commands[batcat] && ! $+commands[bat] )) && alias bat=batcat
(( $+commands[fdfind] && ! $+commands[fd] )) && alias fd=fdfind
(( $+commands[eza] )) && alias ls='eza --group-directories-first'

if (( $+commands[fzf] )); then
  source <(fzf --zsh)
  if (( $+commands[fd] )); then
    export FZF_DEFAULT_COMMAND='fd --type f --hidden --exclude .git'
  elif (( $+commands[fdfind] )); then
    export FZF_DEFAULT_COMMAND='fdfind --type f --hidden --exclude .git'
  fi
  export FZF_CTRL_T_COMMAND=$FZF_DEFAULT_COMMAND
fi

# Python: uv manages interpreters and venvs
(( $+commands[uv] )) && eval "$(uv generate-shell-completion zsh)"

# Activate a venv from ~/.virtualenvs (left over from virtualenvwrapper)
export WORKON_HOME=$HOME/.virtualenvs
function workon() {
  source "$WORKON_HOME/$1/bin/activate"
}

directory_stack=$HOME/.directory_stack

function pushdd() {
    echo $(pwd) >> $directory_stack
}

function popdd() {
    [ ! -s $directory_stack ] && return
    newdir=$(sed -n '$p' $directory_stack)
    sed -i -e '$d' $directory_stack
    cd $newdir
}

function awsenv() {
  unset AWS_ACCESS_KEY_ID AWS_SECRET_ACCESS_KEY AWS_SESSION_TOKEN
  export AWS_PROFILE=$1
  echo "AWS_PROFILE=$1"
}

# Machine-specific config and secrets (untracked)
[[ -f ~/.zshrc.local ]] && source ~/.zshrc.local

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Must be sourced last
source ~/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
