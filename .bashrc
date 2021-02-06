#
# ~/.bashrc
#

#if not running interactively, don't do anything
[[ $- != *i* ]] && return

set -o vi
PS1='\[\e[31m\]\W\[\e[m\] \[\e[32m\]>\[\e[m\] '
#export vblank_mode=0

#  I don't know what these do for now, might or might not break something if disabled
#unset use_color safe_term match_lhs sh
#use_color=true
#xhost +local:root > /dev/null 2>&1
#complete -cf sudo

alias cp='cp -i'		# confirm before overwriting something
alias df='df -h'		# human-readable sizes
alias du='du -h'
alias free='free -h' 

alias ls='ls --color=auto'
alias grep='grep --colour=auto'
alias egrep='egrep --colour=auto'
alias fgrep='fgrep --colour=auto'

# [[ Not sure about these, guess I'll just keep them...

# Bash won't get SIGWINCH if another process is in the foreground.
# Enable checkwinsize so that bash will check the terminal size when
# it regains control.  #65623
# http://cnswww.cns.cwru.edu/~chet/bash/FAQ (E11)
shopt -s checkwinsize
shopt -s expand_aliases

# Enable history appending instead of overwriting.  #139609
shopt -s histappend
# ]]

# # ext - archive extractor
# # usage: ext <file>
ext ()
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
      *)           echo "'$1' cannot be extracted via ext()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

# User added aliases
alias vim='nvim'

#rclone syncs
alias rclone-up-projecte_drawings="rclone sync ~/Documents/Projecte\ drawings/ 'Main gDrive':/'Projecte drawings' -P"
alias rclone-up-music="rclone sync /run/media/vibikim/WAD/Music/ gdrive_music:/Music -P"

alias rclone-down-projecte_drawings="rclone sync 'Main gDrive':/'Projecte drawings' ~/Documents/Projecte\ drawings/ -P"
alias rclone-down-music="rclone sync gdrive_music:/Music /run/media/vibikim/WAD/Music/ -P"
