autoload -Uz compinit promptinit
compinit
promptinit
prompt pure
zstyle ':completion:*' menu select
zstyle ':completion:*' rehash true

source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh


#------------------------------
# Powerline
#------------------------------
# source /usr/local/lib/python2.7/site-packages/powerline/bindings/zsh/powerline.zsh


#------------------------------
# Vi mode
#------------------------------
bindkey -v


#------------------------------
# Variables
#------------------------------
export BROWSER=firefox
export EDITOR=vim
export VISUAL=vim


#------------------------------
# History stuff
#------------------------------
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000


#------------------------------
# Alias
#------------------------------
alias ls='gls --group-directories-first --time-style=+"%d.%m.%Y %H:%M" --color=auto -F'
alias ll='gls -l --group-directories-first --time-style=+"%d.%m.%Y %H:%M" --color=auto -F'
alias la='gls -la --group-directories-first --time-style=+"%d.%m.%Y %H:%M" --color=auto -F'
alias grep='grep --color=tty -d skip'
alias cp="cp -i"                          # confirm before overwriting something
alias df='df -h'                          # human-readable sizes
alias free='free -m'                      # show sizes in MB
alias gp='cd ~/Git/Projects' # go to the projects folder

#------------------------------
# ShellFuncs
#------------------------------
# -- coloured manuals
man() {
  env \
    LESS_TERMCAP_mb=$(printf "\e[1;31m") \
    LESS_TERMCAP_md=$(printf "\e[1;31m") \
    LESS_TERMCAP_me=$(printf "\e[0m") \
    LESS_TERMCAP_se=$(printf "\e[0m") \
    LESS_TERMCAP_so=$(printf "\e[1;44;33m") \
    LESS_TERMCAP_ue=$(printf "\e[0m") \
    LESS_TERMCAP_us=$(printf "\e[1;32m") \
    man "$@"
}

# —- archive extractor
# usage: extract <file>
extract () {
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)   tar xjf $1   ;;
      *.tar.gz)    tar xzf $1   ;;
      *.bz2)       bunzip2 $1   ;;
      *.rar)       unrar x $1   ;;
      *.gz)        gunzip $1    ;;
      *.tar)       tar xf $1    ;;
      *.tbz2)      tar xjf $1   ;;
      *.tgz)       tar xzf $1   ;;
      *.zip)       unzip $1     ;;
      *.Z)         uncompress $1;;
      *.7z)        7z x $1      ;;
      *)           echo "'$1' cannot be extracted via ex()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}
bindkey "^[B" backward-word
bindkey "^[F" forward-word
bindkey "^[a" beginning-of-line
bindkey "^[e" end-of-line

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

BASE16_SHELL=$HOME/.config/base16-shell/
[ -n "$PS1" ] && [ -s $BASE16_SHELL/profile_helper.sh ] && eval "$($BASE16_SHELL/profile_helper.sh)"  
