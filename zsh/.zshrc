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

export LESSOPEN="| /usr/local/bin/src-hilite-lesspipe.sh %s"
export LESS=" -R "
export EDITOR=nvim

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
# [ -f ~/.config/zsh/git-completion.zsh ] && source ~/.config/zsh/git-completion.zsh
export PATH="/usr/local/opt/openjdk/bin:/Users/magnus/.local/bin:$PATH"
[ -f "/Users/magnus/.ghcup/env" ] && source "/Users/magnus/.ghcup/env" # ghcup-env


if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/usr/local/Caskroom/miniconda/base/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/usr/local/Caskroom/miniconda/base/etc/profile.d/conda.sh" ]; then
        . "/usr/local/Caskroom/miniconda/base/etc/profile.d/conda.sh"
    else
        export PATH="/usr/local/Caskroom/miniconda/base/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

