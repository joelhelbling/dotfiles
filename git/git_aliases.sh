#!/bin/sh

# hub
if [ ! -z `which hub` ]; then
  alias git=hub
fi

# Git aliases
alias gs='git status'
alias ga='git add'
alias gap='git add -p'
alias gai='git add -p'
alias gb='git branch'
alias gba='git branch -a'
alias gbv='git branch -vv'
alias gbd="git diff \`git merge-base --fork-point master\`"
alias gc='git commit'
alias gd='git diff'
alias gdb="git diff \`git merge-base --fork-point master\`"
alias gh='git hist'
alias gco='git checkout'
alias gull='git pull origin master'
alias gush='git push origin master'
alias gk='gitk --all&'
alias gx='gitx --all'
alias ggrep='git grep -n'
alias gmr='git br --merged | grep -v master | xargs git br -d'

alias gitst_on='export GIT_PS1_SHOWDIRTYSTATE=true;export GIT_PS1_SHOWSTASHSTATE=true'
alias gitst_off='export GIT_PS1_SHOWSTASHSTATE=;export GIT_PS1_SHOWSTASHSTATE='

# to change command line (PS1) settings for showing dirty/stash states, see ps1.sh
