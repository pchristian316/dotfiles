# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Use powerline
USE_POWERLINE="true" # Source manjaro-zsh-configuration
if [[ -e /usr/share/zsh/manjaro-zsh-config ]]; then
  source /usr/share/zsh/manjaro-zsh-config
fi
# Use manjaro zsh prompt
if [[ -e /usr/share/zsh/manjaro-zsh-prompt ]]; then
  source /usr/share/zsh/manjaro-zsh-prompt
fi

set -o vi

HISTFILE=~/.zsh_history
HISTSIZE=100000
SAVEHIST=100000
setopt HIST_IGNORE_ALL_DUPS
export _JAVA_AWT_WM_NONREPARENTING=1

# rofi
export PATH=$HOME/.config/rofi/scripts:$PATH

# pacman and yay
alias pacup='sudo pacman -Syu'
alias pacin='sudo pacman -Sy'
alias pacrm='sudo pacman -Rns'
alias yayup='yay -Syu'
alias yayin='yay -Sy'
alias yayrm='yay -Rns'
alias unlock='sudo rm /var/lib/pacman/db.lck'
alias mirup='sudo pacman-mirrors --fasttrack && sudo pacman -Syu'

# shutdown quickly
alias shutdown='systemctl poweroff'

# change ls to exa
alias ls='exa -l --icons --color=always --group-directories-first' # my preferred listing
alias la='exa -a --icons --color=always --group-directories-first'  # all files and dirs
alias lt='exa -aT --color=always --group-directories-first' # tree listing
alias l.='exa -a --icons | egrep "^\."'
alias ip='ip -c'

alias qtspim='QT_STYLE_OVERRIDE=gtk2 qtspim'
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
export MANROFFOPT="-c"
export MANPAGER="sh -c 'col -bx | bat -l man -p'"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
# if [ -x "$(command -v tmux)" ] && [ -n "${DISPLAY}" ] && [ -z "${TMUX}" ]; then
#     exec tmux new-session -A -s tmux >/dev/null 2>&1
# fi
#

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
