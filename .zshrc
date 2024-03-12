# Use powerline
USE_POWERLINE="true"
# Source manjaro-zsh-configuration
if [[ -e /usr/share/zsh/manjaro-zsh-config ]]; then
  source /usr/share/zsh/manjaro-zsh-config
fi
# Use manjaro zsh prompt
if [[ -e /usr/share/zsh/manjaro-zsh-prompt ]]; then
  source /usr/share/zsh/manjaro-zsh-prompt
fi

export _JAVA_AWT_WM_NONREPARENTING=1

# doom emacs PATH
export PATH="$HOME/.config/emacs/bin:$PATH"
alias emacs="emacsclient -c -a 'emacs'"

# pacman and yay
alias pacup='sudo pacman -Syu'
alias pacin='sudo pacman -Sy'
alias pacrm='sudo pacman -Rns'
alias yayup='yay -Syu'
alias yayin='yay -Sy'
alias yayrm='yay -Rns'
alias unlock='sudo rm /var/lib/pacman/db.lck'

# shutdown quickly
alias shutdown='systemctl poweroff'

# change ls to exa
alias ls='exa -l --icons --color=always --group-directories-first' # my preferred listing
alias la='exa -a --icons --color=always --group-directories-first'  # all files and dirs
alias lt='exa -aT --color=always --group-directories-first' # tree listing
alias l.='exa -a --icons | egrep "^\."'

alias vim='nvim'
alias cat='bat'

ex ()
{
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)   tar xjf $1   ;;
      *.tar.gz)    tar xzf $1   ;;
      *.bz2)       bunzip2 $1   ;;
      *.rar)       unrar x $1     ;;
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

bindkey '^[[Z' autosuggest-accept

### Random colorscript ###
colorscript random

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

alias ssh="kitty +kitten ssh"
