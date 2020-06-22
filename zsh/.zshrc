# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=5000
SAVEHIST=20000
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/magnus/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

PROMPT='%B%F{red}%n %F{blue}%2~ %F{white}$ %F{default}%b'
setopt AUTO_LIST
setopt MENU_COMPLETE

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
alias ls='ls --color'
alias maude='/usr/local/share/maude2.7.1/maude.linux64'

PATH_TO_FX="/usr/local/share/javafx-sdk-11.0.2/lib"
alias javafxc="javac --module-path $PATH_TO_FX --add-modules javafx.controls,javafx.fxml"
alias javafx="java --module-path $PATH_TO_FX --add-modules javafx.controls,javafx.fxml"

setopt auto_cd
cdpath=($HOME/Snarveier)

CLASSPATH='.:'$PATH_TO_FX

# . ~/Dokumenter/uio-informatikk/IN3110/Obliger/2/climb.sh
. ~/Scripts/climb.sh
