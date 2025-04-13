# zsh config, https://olegk.dev

setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_FIND_NO_DUPS
setopt HIST_SAVE_NO_DUPS

export PROMPT="%1~ \$ "
export HISTCONTROL=ignoreboth:erasedups
export HOMEBREW_NO_AUTO_UPDATE=1
export HOMEBREW_NO_INSTALL_CLEANUP=1

export PATH=/Users/olegkovalov/flutter/bin:$PATH
export PATH=/opt/homebrew/sbin:$PATH
export PATH=/opt/homebrew/bin:$PATH
export PATH=/opt/homebrew/opt/ruby/bin:$PATH
export PATH=/Users/olegkovalov/go/bin:$PATH

# on non-interactive shells exit to speed things.
if [[ ! -o interactive ]]; then
   return
fi

alias ght="go test -v -p=1 -count=100 -race -failfast -shuffle=on -timeout=30m ./... > testout.txt"
alias shcfg="code ~/.zshrc"
alias lnt="golangci-lint run -v --config=~/.golangci.yaml ./..."
alias crl='function _crl() { curl -s "$1" | jq; }; _crl'

alias la="ls -lAoh"
alias cp="cp -i"
alias mv="mv -i"
alias rg="rg --color=never -N -z"
alias k9="kill -9 %1"
alias pubip="curl -w '\n' -s http://ifconfig.me"

eval "$(atuin init zsh --disable-up-arrow)"

convall() {
  ext=$1
  toext=$2
  for i in *.$ext; do ffmpeg -i $i $i.$toext; done
}
