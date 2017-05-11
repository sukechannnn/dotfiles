#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

#---------------------------------------------------------------------
# zsh config
#---------------------------------------------------------------------

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# メモリ内の履歴の数
HISTSIZE=1000000

# $HISTFILE に保存される履歴の数
SAVEHIST=1000000

# 新規メールが来ても、メッセージを出さない。
MAILCHECK=0

fpath=(/usr/local/share/zsh-completions $fpath)

eval "$(direnv hook zsh)"
#---------------------------------------------------------------------
# env
#---------------------------------------------------------------------

export PATH="$HOME/.anyenv/bin:$PATH"
eval "$(anyenv init -)"

export GOPATH="$HOME/go"
export PATH="$PATH:$GOPATH/bin" 

export PGDATA="/usr/local/var/postgres"

export XDG_CONFIG_HOME="$HOME/.config"

#---------------------------------------------------------------------
# alias
#---------------------------------------------------------------------

alias be='bundle exec'
alias gis='git status'
alias gca='git commit --allow-empty'
alias gif='git diff'
alias gic='git commit --verbose'
alias gicm='git commit --message'

#---------------------------------------------------------------------
# cdr
#---------------------------------------------------------------------

autoload -Uz chpwd_recent_dirs cdr
add-zsh-hook chpwd chpwd_recent_dirs
mkdir -p "${XDG_CACHE_HOME:-$HOME/.cache}/shell"
zstyle ':completion:*:*:cdr:*:*' menu selection
zstyle ':completion:*' recent-dirs-insert both
zstyle ':chpwd:*' recent-dirs-max 500
zstyle ':chpwd:*' recent-dirs-default true
zstyle ':chpwd:*' recent-dirs-file "${XDG_CACHE_HOME:-$HOME/.cache}/shell/chpwd-recent-dirs"
zstyle ':chpwd:*' recent-dirs-pushd true

#---------------------------------------------------------------------
# peco
#---------------------------------------------------------------------

# findしてcdするやつ
function cd_peco() {
    cd "$(find . -type d | peco)"  
}
alias cdp="cd_peco"

#pecoでhistory検索
function peco-select-history() {
  BUFFER=$(\history -n -r 1 | peco --query "$LBUFFER")
  CURSOR=$#BUFFER
  zle clear-screen
}
zle -N peco-select-history
bindkey '^r' peco-select-history

# 過去移動したディレクトリに移動
function peco-cdr () {
    local selected_dir=$(cdr -l | awk '{ print $2 }' | peco)
    if [ -n "$selected_dir" ]; then
        BUFFER="cd ${selected_dir}"
        zle accept-line
    fi
    zle clear-screen
}
zle -N peco-cdr
bindkey '^x' peco-cdr

#実行中のプロセスを選択してkill
function peco-pkill() {
  for pid in `ps aux | peco | awk '{ print $2 }'`
  do
    kill $pid
    echo "Killed ${pid}"
  done
}
alias pk="peco-pkill"

# ghqのlist一覧から選択して移動
alias gh='cd $(ghq list -p | peco)'

