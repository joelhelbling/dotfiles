#!/bin/sh
# colors
export GRAY="\e[1;30m"
export CYAN="\e[1;36m"
export BR_YELLOW="\e[1;33m"
export DK_YELLOW="\e[0;33m"
export DK_GREEN="\e[0;32m"
export PERIWINKLE="\e[1;35m"
export NORMAL_COLOR='\e[m'

# git!

# show * for unstaged and + for uncommitted changes
export GIT_PS1_SHOWDIRTYSTATE=true

# show $ if there are stashed files
export GIT_PS1_SHOWSTASHSTATE=true

# git completion
source ~/dotfiles/git/git-completion.bash

function dir_stack {
  echo $(dirs -v | grep -v 0 | sort -r | sed "s@[0-9]@@")
}

function format_dirs {
  echo ""
  for DER in `dir_stack`; do
    if [ "$DER" != "" ]; then
      if [ "$DER" == "~" ]; then
        echo "-- {$USER's home directory}"
      else
        echo "-- $DER"
      fi
    fi
  done
}

# setting the console prompt
export PS1='\e[1;36m$(format_dirs)\n\e[1;35m($(rvm-prompt)$(type __git_ps1 &>/dev/null && __git_ps1 "$PERIWINKLE,$DK_GREEN branch: %s$NORMAL_COLOR")\e[1;35m)\n\e[0;36m\e[1;31m\w/ \e[0;36m<<<\e[m '

