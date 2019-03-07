export PATH=$PATH:/usr/lib/go-1.11/bin
export PATH=$PATH:$HOME/.rbenv/bin
export PROJECT_HOME=$HOME/code
export GOPATH=$PROJECT_HOME/go
export ZSH=$HOME/.oh-my-zsh

# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="gallois"
plugins=(git zsh-history-substring-search z)

source $ZSH/oh-my-zsh.sh

export EDITOR="vim"

alias dev='cd $PROJECT_HOME'
alias v='nvim'

source $HOME/.zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
eval "$(rbenv init -)"
