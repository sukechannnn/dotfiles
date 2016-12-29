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

export PATH="$HOME/.anyenv/bin:$PATH"
eval "$(anyenv init -)"

export GOPATH="$HOME/Develop/Golang/gopath"

export PGDATA="/usr/local/var/postgres"

export HOMEBREW_GITHUB_API_TOKEN="bc9eb5e9b7eb8a7144443199b84e3d324d4cc343"
