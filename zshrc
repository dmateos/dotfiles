# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
case `uname` in
  Darwin)
    export ZSH=/Users/daniel/.oh-my-zsh
  ;;
  Linux)
    export ZSH=/home/daniel/.oh-my-zsh
  ;;
esac

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="gentoo"
#ZSH_THEME="robbyrussell"

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
plugins=(git bundler rake ruby ssh-agent rails aws bower tmux debian)

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

export HELM_HOST=:44134
export TILLER_NAMESPACE=kube-system
alias awsauth-j2="cd ~/work/jtwo/alinta/aws-azure-login/bin; ./index.js --no-prompt --profile jtwo --no-sandbox"
alias awsauth-alinta-core="cd ~/work/jtwo/alinta/aws-azure-login/bin; ./index.js --no-prompt --profile core --no-sandbox"
alias awsauth-alinta-musk="cd ~/work/jtwo/alinta/aws-azure-login/bin; ./index.js --no-prompt --profile musk --no-sandbox"
alias awsauth-alinta-management="cd ~/work/jtwo/alinta/aws-azure-login/bin; ./index.js --no-prompt --profile management --no-sandbox"
alias awsauth-alinta-dev="cd ~/work/jtwo/alinta/aws-azure-login/bin; ./index.js --no-prompt --profile mm-dev --no-sandbox"
alias awsauth-alinta-test="cd ~/work/jtwo/alinta/aws-azure-login/bin; ./index.js --no-prompt --profile mm-test --no-sandbox"
alias awsauth-alinta-mmprod="cd ~/work/jtwo/alinta/aws-azure-login/bin; ./index.js --no-prompt --profile mm-prod --no-sandbox"

alias kubetesla="kubectl config use-context arn:aws:eks:ap-southeast-2:166972549022:cluster/tesla"
alias kubeholden="kubectl config use-context arn:aws:eks:ap-southeast-2:307973494033:cluster/holden"
alias kubeferrari="kubectl config use-context arn:aws:eks:ap-southeast-2:307973494033:cluster/ferrari"
alias kubeford="kubectl config use-context arn:aws:eks:ap-southeast-2:307973494033:cluster/ford"
alias kubetelnack="kubectl config use-context arn:aws:eks:ap-southeast-2:307973494033:cluster/telnack"
alias kubemusk="kubectl config use-context arn:aws:eks:ap-southeast-2:321263155876:cluster/musk"
alias kubefisker="kubectl config use-context arn:aws:eks:ap-southeast-2:321349407524:cluster/fisker"
alias kubemgmt="kubectl config use-context arn:aws:eks:ap-southeast-2:688775463618:cluster/management"

alias kubecsd="az aks get-credentials --resource-group cs-ae-rg-common --name cs-ae-aks-common --subscription 6ec61a38-33b4-4e76-905a-2adc7eb5f2f3"
alias kubecsp="az aks get-credentials --resource-group cs-ae-rg-common --name cs-ae-aks-prod --subscription 6ec61a38-33b4-4e76-905a-2adc7eb5f2f3"

fortune | cowsay -f ~/dotfiles/bong.cow | lolcat
