#!/bin/sh

# colors
export RED="\[\e[1;31m\]"
export CYAN="\[\e[1;36m\]"
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

function node_version {
  echo "node-`nvm current | sed 's/v//'`"
}

function git_prompt {
  type __git_ps1 &>/dev/null && __git_ps1 "\e[0;35m ⎇  %s"
}

# setting the console prompt
export PS1="\
$CYAN\
$(echo '$(format_dirs)')\
\n
$OPEN\
$RED$(echo '$(rvm-prompt)') \
$DIVIDER \
$DK_GREEN$(echo '$(node_version)') \
$DIVIDER\
$(echo '$(git_prompt)') \
$CLOSE\
\n\
[ $CYAN\u@\h $DK_YELLOW] \
$LIGHT_CYAN\w/ \
$PROMPT"

