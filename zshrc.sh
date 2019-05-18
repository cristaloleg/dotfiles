ZSH_THEME="robbyrussell"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=( git go )

source $ZSH/oh-my-zsh.sh

### {{ COLORS

RESET='\033[0m'
BLACK='\033[0;30m'
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
BLUE='\033[0;34m'
MAGENTA='\033[0;35m'
CYAN='\033[0;36m'
WHITE='\033[0;37m'

### }} COLORS

### {{ HISTORY

setopt no_share_history

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
HIST_STAMPS="yyyy-mm-dd"

# Do not write command to history if it starts with space
setopt HIST_IGNORE_SPACE
setopt HIST_NO_STORE

# Dot not save duplicate commands
setopt HIST_SAVE_NO_DUPS
HISTFILE=$HOME/.zhistory
HISTSIZE=4000
SAVEHIST=2000

# One history for all sessions
setopt APPEND_HISTORY
setopt INC_APPEND_HISTORY
setopt SHARE_HISTORY

# Save the time and how long a command ran
#setopt EXTENDED_HISTORY

### }} HISTORY

### {{ EXPORTS

export GOPATH=$HOME/go
export PATH=$GOPATH/bin:$PATH

### }} EXPORTS

### {{ ALIASES

# Enable aliases to be sudo’ed
alias sudo="sudo "
alias svim="sudo vim"

alias chrome="/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome"

# URL-encode strings
alias urlencode='python -c "import sys, urllib as ul; print ul.quote_plus(sys.argv[1]);"'

# Print each PATH entry on a separate line
alias path="echo -e ${PATH//:/\\n}"

alias zshconfig="code ~/.zshrc"
alias grh="history | rg"

alias brewup="brew update && brew upgrade && brew cleanup"

alias rm="rm -i" # better safe than sorry.
alias cp="cp -i" # better safe than sorry.
alias mv="mv -i" # better safe than sorry.

alias gz="tar -zcvf"
alias ugz="tar zxvf"

alias psa="ps aux"
alias psg="ps aux | rg "
alias md="mkdir -p"

alias servehere="python -m SimpleHTTPServer" # 'ruby -run -e httpd . -p 8000'

alias ip="curl ipinfo.io/ip"
alias ips="ifconfig -a | perl -nle'/(\d+\.\d+\.\d+\.\d+)/ && print $1'"

### }} ALIASES

### {{ REDEFINES
### }} REDEFINES

### {{ FUNCTIONS

function setjava8 {
  export JAVA_HOME="/Library/Java/JavaVirtualMachines/jdk1.8.0_172.jdk/Contents/Home/"
  java -version
}
function setjava10 {
  export JAVA_HOME="/Library/Java/JavaVirtualMachines/jdk-10.0.1.jdk/Contents/Home/"
  java -version
}

mkd ()
{
  mkdir -p -- "$1" &&
  cd -P -- "$1"
}

retry() {
  local n=$1
  shift
  for i in $(seq $n); do
    "$@"
  done
}

cnt() { wc -l }
psgrep() { ps axu | grep -v grep | grep "$@" -i --color=auto; }
search() { find . -iname "*$@*" | less; }

b64encode() { base64 }

b64decode()
{
  if (( $# == 0 )) ; then
    base64 --decode < /dev/stdin
    echo
  else
    base64 --decode <<< "$1"
    echo
  fi
}

convall() {
  ext=$1
  toext=$2
  for i in *.$ext; do ffmpeg -i $i $i.$toext; done
}

### }} FUNCTIONS

### {{ PROMPT

# function git_info() {
#   local ref
#   ref=$(command git symbolic-ref HEAD 2> /dev/null) || \
#   ref=$(command git rev-parse --short HEAD 2> /dev/null) || return 0
#   echo "${ref#refs/heads/}"
# }

# PROMPT='
# '
# PROMPT+='# %{$fg[green]%}%~'
# PROMPT+='%{$fg_bold[blue]%}%{$reset_color%} '
# PROMPT+='%{$fg[red]%}$(git_info)%{$reset_color%}'
# PROMPT+='$ '

# RPROMPT='[%D{%T}]'

### }} PROMPT