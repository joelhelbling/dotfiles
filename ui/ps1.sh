#!/bin/sh

# colors
export RED="\[\e[1;31m\]"
export BLUE="\[\e[0;34m\]"
export LIGHT_CYAN="\[\e[0;36m\]"
export BR_YELLOW="\[\e[1;33m\]"
export DK_YELLOW="\[\e[0;33m\]"
export DK_GREEN="\[\e[0;32m\]"
export LIGHT_GREEN="\[\e[1;32m\]"
export PERIWINKLE="\[\e[1;35m\]"
export MAGENTA="\[\e[0;35m\]"
export NORMAL_COLOR="\[\e[m\]"

export    OPEN="${DK_YELLOW}《"
export DIVIDER="${DK_YELLOW}::"
export   CLOSE="${DK_YELLOW}》"
export  PROMPT="${DK_YELLOW}➤${NORMAL_COLOR} "

# show * for unstaged and + for uncommitted changes
export GIT_PS1_SHOWDIRTYSTATE=true

# show $ if there are stashed files
export GIT_PS1_SHOWSTASHSTATE=true

# git
source ~/dotfiles/git/git-completion.bash
source ~/dotfiles/git/git-prompt.sh

function dir_stack {
  echo $(dirs -v            | \
         grep -v 0          | \
         sort -r            | \
         sed "s@^ @@g"      | \
         sed "s@  @@g"      | \
         sed "s@[0-9]@[&]::@" )
}

function prettify {
  echo "$1" | sed "s@\:\:@ @g"
}

function format_dirs {
  echo ""
  for DER in `dir_stack`; do
    echo $(prettify $DER)
  done
}

function rbenv_version {
  if [ ! -z `which rbenv` ]; then
    echo "ruby-`rbenv local 2> /dev/null || rbenv global 2> /dev/null || echo '???'` 》"
  fi
}

function node_version {
  if [ -d ~/.nvm ] && [ ! -z "$(type nvm 2> /dev/null)" ]; then
    echo "node-`nvm current | sed 's/v//'` 》"
  fi
}

function git_prompt {
  type __git_ps1 &>/dev/null && __git_ps1 "\e[1;35m⎇  %s 》"
}

# setting the console prompt
export PS1="\
$LIGHT_CYAN\
$(echo '$(format_dirs)')\
\n
$CLOSE\
$RED$(echo '$(rbenv_version)')\
$DK_GREEN$(echo '$(node_version)')\
$(echo '$(git_prompt)')\
\n\
$DK_YELLOW[$BLUE \u@\h $DK_YELLOW] \
$LIGHT_CYAN\w/ \
$PROMPT"

