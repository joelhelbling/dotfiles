#!/bin/sh

# Git aliases
alias gs='git status'
alias ga='git add'
alias gb='git branch'
alias gba='git branch -a'
alias gc='git commit'
alias gd='git diff'
alias gh='git hist'
alias gco='git checkout'
alias gull='git pull origin master'
alias gush='git push origin master'
alias gk='gitk --all&'
alias gx='gitx --all'
alias gitx='/Applications/GitX.app/Contents/MacOS/GitX &'

alias gitst_on='export GIT_PS1_SHOWDIRTYSTATE=true;export GIT_PS1_SHOWSTASHSTATE=true'
alias gitst_off='export GIT_PS1_SHOWSTASHSTATE=;export GIT_PS1_SHOWSTASHSTATE='

# to change command line (PS1) settings for showing dirty/stash states, see ps1.sh
