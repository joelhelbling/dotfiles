#!/bin/sh
# colors
export GRAY="\e[1;30m"
export CYAN="\e[1;36m"
export BR_YELLOW="\e[1;33m"
export DK_YELLOW="\e[0;33m"
export DK_GREEN="\e[0;32m"
export NORMAL_COLOR='\e[m'

# git!

# show * for unstaged and + for uncommitted changes
export GIT_PS1_SHOWDIRTYSTATE=true

# show $ if there are stashed files
export GIT_PS1_SHOWSTASHSTATE=true

# git completion
source ~/dotfiles/git/git-completion.bash

function tildafier {
  echo $1 | sed "s@$HOME@~@"
}
function reverse_dirs {
  CURRENT=$(tildafier "$PWD")
  echo `dirs` | sed "s@$CURRENT@@ " | sed "s/ /\n## /g" | sort -r
}
function format_dirs {
  DIRS=`reverse_dirs`
  if [ "$DIRS" != "" ]; then
    echo $DIRS | sed "s/## /\n## + /g"
  fi
}
# setting the console prompt
export PS1=' \e[1;33m\w\e[m$(type __git_ps1 &>/dev/null && __git_ps1 "$DK_GREEN<%s>$NORMAL_COLOR") \e[1;36m::\e[m '
#export PS1='\n\n\e[0;36m########\n##$(format_dirs)\n\e[0;36m##   \e[1;33m\w\e[m$(type __git_ps1 &>/dev/null && __git_ps1 "$DK_GREEN<%s>$NORMAL_COLOR")\n\e[0;36m##\n\e[1;36m>>>\e[m '

