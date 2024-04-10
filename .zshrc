#---------- STYLE
# Colors for ls command
LS_COLORS='rs=0:di=01;34:ln=01;36:mh=00:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:mi=00:su=37;41:sg=30;43:ca=30;41:tw=30;42:ow=34;42:st=37;44:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arc=01;31:*.arj=01;31:*.taz=01;31:*.lha=01;31:*.lz4=01;31:*.lzh=01;31:*.lzma=01;31:*.tlz=01;31:*.txz=01;31:*.tzo=01;31:*.t7z=01;31:*.zip=01;31:*.z=01;31:*.dz=01;31:*.gz=01;31:*.lrz=01;31:*.lz=01;31:*.lzo=01;31:*.xz=01;31:*.zst=01;31:*.tzst=01;31:*.bz2=01;31:*.bz=01;31:*.tbz=01;31:*.tbz2=01;31:*.tz=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.war=01;31:*.ear=01;31:*.sar=01;31:*.rar=01;31:*.alz=01;31:*.ace=01;31:*.zoo=01;31:*.cpio=01;31:*.7z=01;31:*.rz=01;31:*.cab=01;31:*.wim=01;31:*.swm=01;31:*.dwm=01;31:*.esd=01;31:*.jpg=01;35:*.jpeg=01;35:*.mjpg=01;35:*.mjpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.svg=01;35:*.svgz=01;35:*.mng=01;35:*.pcx=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.m2v=01;35:*.mkv=01;35:*.webm=01;35:*.webp=01;35:*.ogm=01;35:*.mp4=01;35:*.m4v=01;35:*.mp4v=01;35:*.vob=01;35:*.qt=01;35:*.nuv=01;35:*.wmv=01;35:*.asf=01;35:*.rm=01;35:*.rmvb=01;35:*.flc=01;35:*.avi=01;35:*.fli=01;35:*.flv=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.yuv=01;35:*.cgm=01;35:*.emf=01;35:*.ogv=01;35:*.ogx=01;35:*.aac=00;36:*.au=00;36:*.flac=00;36:*.m4a=00;36:*.mid=00;36:*.midi=00;36:*.mka=00;36:*.mp3=00;36:*.mpc=00;36:*.ogg=00;36:*.ra=00;36:*.wav=00;36:*.oga=00;36:*.opus=00;36:*.spx=00;36:*.xspf=00;36:'

# Completion to use custom colors and select menu
# todo identify specifically what each one does
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' menu select
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
bindkey '^[[Z' reverse-menu-complete
zstyle ':zle:*ward-word' word-style space
zstyle ":completion:*:default" list-colors ${(s.:.)LS_COLORS} "ma=48;5;153;1"

#---------- KEYBINDINGS

# todo identify specifically what each one does
bindkey $'\E[1;5D' emacs-backward-word
bindkey $'\E[1;5C' emacs-forward-word
bindkey '^r' fzf-history-widget
bindkey '^[[Z' reverse-menu-complete
bindkey '^H' backward-kill-word
bindkey -M emacs '^[[3;5~' kill-word
bindkey  "^[[H"   beginning-of-line
bindkey  "^[[F"   end-of-line
bindkey  "^[[3~"  delete-char
set +o prompt_cr +o prompt_sp

#---------- NAVIGATION
# Enable cd by only tiping folder name
setopt autocd

# Remove $ when running output on starship
unsetopt PROMPT_SP

# Delete / slashes instead of entire folder path
autoload -U select-word-style
select-word-style bash

#---------- CUSTOM FUNCTIONS
#! Create a file inside ~/.zsh_functions with the function name you want.
#! This script will load all files inside this folder.
fpath=(~/.zsh_functions $fpath)
autoload -U $fpath[1]/*(.:t)

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

# Terraform
complete -o nospace -C $HOME/.tfenv/versions/1.2.5/terraform terraform

# Kubectx
source ~/.zsh/kubectx-completion/

#? https://github.com/zsh-users/zsh-completions
# todo change later to antigen plugin
source ~/.zsh/zsh-completion/src/

#---------- ALIASES
#! Use ~/.aliases file to load sensitive aliases
source $HOME/.aliases

alias bcat="batcat"
alias bname="git branch | grep \* | cut -d ' ' -f 2 | tr -d '\n'"
alias c="clear"
alias cat="batcat -p"
alias copy="xclip -sel clip"
alias currentHash='git rev-parse --verify HEAD | cut -c1-8'
alias cp="/opt/advcpmv/advcp -rg"
alias d="docker"
alias dbash="d run -it --entrypoint=/bin/bash"
alias fd="fdfind"
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
alias ls="exa --icons --group-directories-first"
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
alias pingg="ping 8.8.8.8"
alias psrg="ps -ef | rg"
alias stern="k stern"
alias tf="terraform"
alias tree="exa --tree"
alias update_all="sudo apt update && sudo apt upgrade -y && flatpak update -y && sudo snap refresh"
alias watch-1="watch -n1 "

#---------- APPLICATIONS
# fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# asdf
. $HOME/.asdf/asdf.sh
fpath=(${ASDF_DIR}/completions $fpath)

# Tilix fix
if [ $TILIX_ID ] || [ $VTE_VERSION ]; then
    source /etc/profile.d/vte.sh
fi

# fnm
export PATH="$HOME/.local/share/fnm:$PATH"
eval "$(fnm env --use-on-cd)"

#---------- PLUGINS
source ~/.zsh/antigen.zsh
antigen bundle Aloxaf/fzf-tab
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle agkozak/zsh-z
antigen apply

#---------- STARSHIP
eval "$(starship init zsh)"
