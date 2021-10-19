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

# Do not raise `zsh: no matches found`
setopt nonomatch
fpath=($(brew --prefix)/share/zsh/site-functions $fpath)
eval "$(direnv hook zsh)"

# 時計
precmd () {
  psvar=()
  psvar[1]=$(date "+%H:%M:%S");
}
RPROMPT='${editor_info[overwrite]}%(?:: %F{1}✘ %? %f)${VIM:+" %B%F{6}V%f%b"}${_prompt_sorin_git} %1v'

# Ruby build config
RUBY_CONFIGURE_OPTS="--with-readline-dir=`brew --prefix readline` --with-openssl-dir=`brew --prefix openssl`"

#---------------------------------------------------------------------
# env
#---------------------------------------------------------------------
export PATH="$HOME/.anyenv/bin:$PATH"
eval "$(anyenv init -)"

export GOPATH="$HOME/go"
export PATH="$PATH:$GOPATH/bin"
export GOROOT=`go env GOROOT`

export PGDATA="/usr/local/var/postgres"

export XDG_CONFIG_HOME="$HOME/.config"

export PATH="$PATH:/usr/local/share/git-core/contrib/diff-highlight"

export PATH="$PATH:/usr/local/opt/avr-gcc@7/bin"

export PATH="/usr/local/opt/libxml2/bin:$PATH"
export PATH="/usr/local/opt/postgresql@10/bin:$PATH"

export PATH="$PATH:/Users/sukechannnn/go/src/github.com/sukechannnn/dev_util_cmds/bin"

export PATH="$PATH:/usr/local/bin/code"
export PATH="$PATH:/usr/local/bin/atom-nightly"
export PATH="$PATH:/usr/local/bin/apm-nightly"

export GO111MODULE=on

#---------------------------------------------------------------------
# alias
#---------------------------------------------------------------------

alias be='bundle exec'
alias gis='git status'
alias gca='git commit --allow-empty'
alias gco='noglob git checkout'
alias gcop='noglob git checkout `git branch | peco`'
alias gch='git cherry-pick'
alias gif='git diff'
alias gic='git commit --verbose'
alias gicm='git commit --message'
alias gpul='git pull origin `git symbolic-ref --short HEAD`'
alias glgl='git log --graph --pretty=format:"${_git_log_oneline_format}"'
alias rubodiff='bundle exec rubocop $(git status --short | grep -e ".*\.rb" | sed -E s/M+// | sed s/A// | sed s/D.*//)'
alias rubodiff-a='bundle exec rubocop $(git status --short | grep -e ".*\.rb" | sed -E s/M+// | sed s/A// | sed s/D.*//) $1 -a'
alias sp='bundle exec rspec'
alias sps='bin/rspec-skip-test-setup'
alias wifi-ckeck='/System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport -I'
alias gifc='git diff --cached'
alias gbrm='git branch --merged origin/master | grep -v "^\s*master" | grep -v "^*" | xargs git branch -D'
alias ghco='noglob gh pr checkout'
alias prbrowse='gh pr view `git branch --show-current`'
alias vim='nvim'

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
alias ghl='cd $(ghq list -p | peco)'


[ -f "$HOME/.shopify-app-cli/shopify.sh" ] && source "$HOME/.shopify-app-cli/shopify.sh"

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/Users/sukechannnn/.sdkman"
[[ -s "/Users/sukechannnn/.sdkman/bin/sdkman-init.sh" ]] && source "/Users/sukechannnn/.sdkman/bin/sdkman-init.sh"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/sukechannnn/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/sukechannnn/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/sukechannnn/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/sukechannnn/google-cloud-sdk/completion.zsh.inc'; fi
