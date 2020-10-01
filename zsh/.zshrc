# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=5000
SAVEHIST=20000
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
# zstyle :compinstall filename '/home/magnus/.zshrc'

# autoload -Uz compinit
# compinit
# End of lines added by compinstall

PROMPT='%B%F{red}%n %F{blue}%2~ %F{white}$ %F{default}%b'
setopt AUTO_LIST
setopt MENU_COMPLETE

export LESSOPEN="| /usr/local/bin/src-hilite-lesspipe.sh %s"
export LESS=" -R "
export EDITOR=nvim

source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

alias vim=nvim
alias py="python3"
alias vrc="vim ~/.vimrc"
alias zrc="vim ~/.zshrc"
alias zsc="source ~/.zshrc"
alias trc="vim ~/.tmux.conf"
alias gitadog="git log --all --decorate --oneline --graph"
alias nat="nautilus --browser ."
alias jr="~/Scripts/javar.sh"
alias nodei="~/Scripts/nodei.sh"
alias mkemne="~/Scripts/mkemne.sh"
alias scheme='racket -I "r5rs/init"'
alias ll='ls -lAh'
alias code=codium
alias cdr='cd -P $PWD'
alias ls='ls -G'
alias maude='/usr/local/share/maude2.7.1/maude.linux64'

setopt auto_cd
cdpath=($HOME/Snarveier)

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
