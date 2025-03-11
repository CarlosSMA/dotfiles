#---------- IDEs
# Use emacs format for terminal navigation
bindkey -e

# Use vim as default editor for CLIs
export EDITOR=vim

#---------- STYLE
# Colors for ls command
eval $(dircolors)

# Ignore case-sensitivity on tab completion
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'

# Tab menu
zstyle ':completion:*' menu no

# todo identify specifically what each one does
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' menu select
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
bindkey '^[[Z' reverse-menu-complete
zstyle ':zle:*ward-word' word-style space
zstyle ":completion:*:default" list-colors ${(s.:.)LS_COLORS} "ma=48;5;153;1"


# fzf-tab menu
bindkey '^[[Z' reverse-menu-complete
zstyle ':zle:*ward-word' word-style space

#---------- NAVIGATION

# KEYBINDINGS
#todo identify specifically what each one does
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word
bindkey $'\E[1;5C' emacs-forward-word
bindkey '^[[Z' reverse-menu-complete
bindkey '^H' backward-kill-word
bindkey -M emacs '^[[3;5~' kill-word
bindkey  '^[[H' beginning-of-line
bindkey  '^[[F' end-of-line
bindkey  '^[[3~' delete-char

# Enable cd by only tiping folder name
setopt autocd

# Remove $ when running output on starship
# But without ommiting the output
set +o prompt_cr +o prompt_sp

# Delete / slashes instead of entire folder path
export WORDCHARS=''

# Tilix fix. Allows new terminal sessions to be opened at the folder of previous session.
if [ $TILIX_ID ] || [ $VTE_VERSION ]; then
  source /etc/profile.d/vte.sh
fi

#---------- CUSTOM FUNCTIONS
#! Create a file inside ~/.zsh_functions with the function name you want.
#! This script will load all files inside this folder.
fpath=(~/.zsh_functions $fpath)
autoload -Uz $fpath[1]/*(.:t)

#---------- HISTORY
# Share history between multiple terminal sessions
setopt INC_APPEND_HISTORY
setopt EXTENDED_HISTORY
setopt HIST_IGNORE_ALL_DUPS
export HISTFILE=~/.zsh_history
export HISTSIZE=1000
export SAVEHIST=1000

#---------- COMPLETIONS
# Gcloud
source $HOME/google-cloud-sdk/path.zsh.inc
source $HOME/google-cloud-sdk/completion.zsh.inc

# Kubectx
source ~/.zsh/kubectx-completion/

#? https://github.com/zsh-users/zsh-completions
# todo change later to antigen plugin
# source ~/.zsh/zsh-completions/src/

# Vagrant
fpath=(/opt/vagrant/embedded/gems/gems/vagrant-2.4.1/contrib/zsh $fpath)

#---------- ALIASES
#! Use ~/.aliases file to load sensitive aliases
source $HOME/.aliases

alias bcat="bat"
alias bname="git branch | grep \* | cut -d ' ' -f 2 | tr -d '\n'"
alias c="clear"
alias cat="bat -p"
alias copy="xclip -sel clip"
alias currentHash='git rev-parse --verify HEAD | cut -c1-8'
alias cp="/opt/advcpmv/advcp -rg"
alias d="docker"
alias dbash="d run -it --entrypoint=/bin/bash"
alias g="git"
alias history="fc -li 1"
alias k="kubectl"
alias kctx="kubectl ctx"
alias ked="kubectl edit deploy"
alias kens="kubectl ns"
alias keti="kubectl exec -ti"
alias kgp="kubectl get pods"
alias kns="kubectl get ns"
alias kpg="kubectl get pods"
alias kubectx="kubectl ctx"
alias kubens="kubectl ns"
alias lad="lazydocker"
alias ldo="lazydocker"
alias lg="lazygit"
alias ls="eza --icons --group-directories-first"
alias minidocker='eval $(minikube docker-env)'
alias mv="/opt/advcpmv/advmv -g"
alias nb="npm run build"
alias nf="npm run format"
alias nrb="npm run build"
alias nrf="npm run format"
alias nt="npm run test"
alias nt="npm run test"
alias nvm="fnm"
alias ping8="ping 8.8.8.8"
alias pingg="ping google.com"
alias psrg="ps -ef | rg"
alias stern="k stern"
alias tf="terraform"
alias tree="eza --tree"
alias update_all="sudo dnf upgrade -y && flatpak update -y"
alias watch-1="watch -n1 "

#---------- APPLICATIONS
# fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# asdf
. $HOME/.asdf/asdf.sh
fpath=(${ASDF_DIR}/completions $fpath)

#---------- PLUGINS
source $HOME/.antidote/antidote.zsh
antidote load

source /usr/share/fzf/shell/key-bindings.zsh

#---------- STARSHIP
eval "$(starship init zsh)"

#---------- GOLANG
export GOROOT=$HOME/.local/share/go

#---------- ZOXIDE
autoload -Uz compinit && compinit -i
eval "$(zoxide init zsh)"

#---------- FNM
export PATH="$HOME/.local/share/fnm:${KREW_ROOT:-$HOME/.krew}/bin:$HOME/.local/bin:$GOROOT/bin:$HOME/go/bin:$PATH"
eval "$(fnm env --use-on-cd --version-file-strategy=recursive)"
