export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"
plugins=(kube-ps1 git docker aws aliases dotenv)

source $ZSH/oh-my-zsh.sh
PROMPT='$(kube_ps1)'$PROMPT

#### CUSTOM ####

# Misc
alias lld='ll -a | grep -e ^d' 										# list only directories
alias llf='ll -a | grep -v -e ^d' 									# list only files
alias cat=bat 												# More colorful cat
alias hss='hugo server --noHTTPCache --disableFastRender' 						# Hugo

# Docker
alias enterdocker='docker run -it --rm --privileged --pid=host justincormack/nsenter1'			# enter the hyperkit VM docker desktop uses 

# Not using GPG Suite, so we for some reason need to set the GPG TTY.
export GPG_TTY=$(tty)

# Path modifications 
export PATH="$(go env GOPATH)/bin:$PATH" 								# go
export PATH="$PATH:$HOME/.lmstudio/bin" 							# lmstudio
export PATH="${PATH}:$HOME/.ghcup/bin" 							# haskell

# syntax highlighting
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Kubernetes
[ -f ~/.kubectl_aliases ] && source ~/.kubectl_aliases
alias kctx='kubectx'
alias kns='kubens'
KUBE_PS1_ENABLED=off

# AWS
alias awson='aws sts get-caller-identity &>/dev/null && asp default || asp default login'
alias awsoff='asp &> /dev/null'
