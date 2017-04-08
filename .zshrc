#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

fpath=(/usr/local/share/zsh-completions $fpath)

export PATH="$HOME/.anyenv/bin:$PATH"
eval "$(anyenv init -)"

export GOPATH="$HOME/go"
export PATH="$PATH:$GOPATH/bin" 

export PGDATA="/usr/local/var/postgres"

export XDG_CONFIG_HOME="$HOME/.config"

alias be='bundle exec'
alias gis='git status'
alias gca='git commit --allow-empty'
alias gif='git diff'
alias gic='git commit --verbose'
alias gicm='git commit --message'
