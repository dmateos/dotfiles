# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

ZSH_DISABLE_COMPFIX="true"

# Path to your oh-my-zsh installation.
case `uname` in
  Darwin)
    export ZSH=/Users/daniel/.oh-my-zsh
    path=('/opt/homebrew/bin' $path)
  ;;
  Linux)
    export ZSH=/home/daniel/.oh-my-zsh
  ;;
esac

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
#ZSH_THEME="gentoo"
#ZSH_THEME="robbyrussell"
ZSH_THEME="powerlevel10k/powerlevel10k"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git bundler rake ruby ssh-agent rails aws bower tmux debian zsh-autosuggestions)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
#source /usr/local/share/chruby/chruby.sh
alias vim=nvim
export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/Devel

case `uname` in
  Darwin)
    VIRTUALENVWRAPPER_PYTHON=/usr/bin/python3
    source /usr/local/bin/virtualenvwrapper.sh
    directory_stack=/Users/daniel/.directory_stack
  ;;
  Linux)
    source /usr/share/virtualenvwrapper/virtualenvwrapper.sh
    directory_stack=/home/daniel/.directory_stack
  ;;
esac

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
  export AWS_ACCESS_KEY_ID=$(aws configure get aws_access_key_id --profile $1);
  export AWS_SECRET_ACCESS_KEY=$(aws configure get aws_secret_access_key --profile $1);
  export AWS_DEFAULT_REGION=$(aws configure get region --profile $1);
  echo "$1 environment variables exported";
}

export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
if command -v pyenv 1>/dev/null 2>&1; then
 eval "$(pyenv init -)"
 eval "$(pyenv virtualenv-init -)"
fi

export HELM_HOST=:44134
export TILLER_NAMESPACE=kube-system

HISTSIZE=999999999
SAVEHIST=$HISTSIZE

alias awsauth-j2="cd ~/work/jtwo/alinta/aws-azure-login/bin; ./index.js --no-prompt --profile jtwo --no-sandbox"
alias awsauth-alinta-core="cd ~/work/jtwo/alinta/aws-azure-login/bin; ./index.js --no-prompt --profile core --no-sandbox"
alias awsauth-alinta-musk="cd ~/work/jtwo/alinta/aws-azure-login/bin; ./index.js --no-prompt --profile musk --no-sandbox"
alias awsauth-alinta-management="cd ~/work/jtwo/alinta/aws-azure-login/bin; ./index.js --no-prompt --profile management --no-sandbox"
alias awsauth-alinta-dev="cd ~/work/jtwo/alinta/aws-azure-login/bin; ./index.js --no-prompt --profile mm-dev --no-sandbox"
alias awsauth-alinta-test="cd ~/work/jtwo/alinta/aws-azure-login/bin; ./index.js --no-prompt --profile mm-test --no-sandbox"
alias awsauth-alinta-uat="cd ~/work/jtwo/alinta/aws-azure-login/bin; ./index.js --no-prompt --profile mm-uat --no-sandbox"
alias awsauth-alinta-uat2="cd ~/work/jtwo/alinta/aws-azure-login/bin; ./index.js --no-prompt --profile mm-uat2 --no-sandbox"
alias awsauth-alinta-mmprod="cd ~/work/jtwo/alinta/aws-azure-login/bin; ./index.js --no-prompt --profile mm-prod --no-sandbox"
alias awsauth-alinta-training="cd ~/work/jtwo/alinta/aws-azure-login/bin; ./index.js --no-prompt --profile mm-training --no-sandbox"

alias kubetesla="kubectl config use-context arn:aws:eks:ap-southeast-2:166972549022:cluster/tesla"
alias kubeholden="kubectl config use-context arn:aws:eks:ap-southeast-2:307973494033:cluster/holden"
alias kubeferrari="kubectl config use-context arn:aws:eks:ap-southeast-2:307973494033:cluster/ferrari"
alias kubeford="kubectl config use-context arn:aws:eks:ap-southeast-2:307973494033:cluster/ford"
alias kubetelnack="kubectl config use-context arn:aws:eks:ap-southeast-2:307973494033:cluster/telnack"
alias kubemusk="kubectl config use-context arn:aws:eks:ap-southeast-2:321263155876:cluster/musk"
alias kubefisker="kubectl config use-context arn:aws:eks:ap-southeast-2:321349407524:cluster/fisker"
alias kubeearl="kubectl config use-context arn:aws:eks:ap-southeast-2:760694178318:cluster/earl"
alias kubemgmt="kubectl config use-context arn:aws:eks:ap-southeast-2:688775463618:cluster/management"
alias kubetraining="kubectl config use-context arn:aws:eks:ap-southeast-2:405083348655:cluster/sayer"

alias kubecsp="az aks get-credentials --resource-group cs-ae-rg-common --name cs-ae-aks-prod --subscription 6ec61a38-33b4-4e76-905a-2adc7eb5f2f3"; KENV=csprod0
alias kubecsd="az aks get-credentials --resource-group nonprod-telstra-cs-ae-rg --name nonprod-telstra-cs-ae-aks --subscription 6ec61a38-33b4-4e76-905a-2adc7eb5f2f3"; KENV=telstra-master
alias kubecsd1="az aks get-credentials --resource-group nonprod-telstra-cs-ae-rg --name nonprod-telstra-cs-ae-aks --subscription 6ec61a38-33b4-4e76-905a-2adc7eb5f2f3"; KENV=csdev1
alias kubecsp="az aks get-credentials --resource-group prod-0-cs-ae-rg --name prod-0-cs-ae-aks --subscription 6ec61a38-33b4-4e76-905a-2adc7eb5f2f3"; KENV=csprod0
alias kubecsuk="az aks get-credentials --resource-group prod-0-cs-uks-rg --name prod-0-cs-uks-aks --subscription 6ec61a38-33b4-4e76-905a-2adc7eb5f2f3"; KENV=csproduk0
alias kubeawsnimbusdev="kubectl config use-context arn:aws:eks:ap-southeast-2:761249264205:cluster/apollo-dev-eks"
alias kubej2="az aks get-credentials --resource-group prod-0-j2-ae-rg --name prod-0-j2-ae-aks --subscription 6cd1942f-e571-4a87-87af-095ab69e23b5"; 
alias kubedem="az aks get-credentials --resource-group dem-rg-seismicarchive-aue-01 --name dem-seismicarchive-prod-k8-cluster --subscription 14ed4bd5-2893-427c-98ae-bfb1f220b196"

fortune | cowsay -f ~/dotfiles/bong.cow | lolcat

. "$HOME/.cargo/env"

source ~/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
export PATH="/opt/homebrew/opt/openjdk/bin:/usr/local/share/dotnet/sdk:$PATH"
export PATH="/opt/homebrew/opt/libpq/bin:$PATH"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
