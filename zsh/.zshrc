# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=5000
SAVEHIST=20000
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
# zstyle :compinstall filename '/home/magnus/.zshrc'

autoload -U compinit && compinit
fpath=(~/.config/zsh $fpath)
zmodload -i zsh/complist
# End of lines added by compinstall

PROMPT='%B%F{red}%n %F{blue}%2~ %F{white}$ %F{default}%b'
setopt AUTO_LIST
setopt MENU_COMPLETE

export LESS=" -R "
export EDITOR=nvim

alias vim=nvim
alias py="python3"
alias vrc="vim ~/.vimrc"
alias zrc="vim ~/.zshrc"
alias zsc="source ~/.zshrc"
alias trc="vim ~/.tmux.conf"
alias gitadog="git log --all --decorate --oneline --graph"
alias ll='ls -lAh'
alias code=codium
alias cdr='cd -P $PWD'
alias ls='ls -G'
alias maude='/usr/local/share/maude2.7.1/maude.linux64'

setopt auto_cd
cdpath=($HOME/Snarveier)

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
# [ -f ~/.config/zsh/git-completion.zsh ] && source ~/.config/zsh/git-completion.zsh
export PATH="/usr/local/opt/openjdk/bin:/Users/magnus/.local/bin:$PATH"
[ -f "/Users/magnus/.ghcup/env" ] && source "/Users/magnus/.ghcup/env" # ghcup-env

export NVM_DIR="$HOME/.nvm"
  [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

export XDG_CONFIG_HOME="$HOME/.config"
