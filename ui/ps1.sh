#!/bin/sh

# colors
# export RED="\[\e[1;31m\]"
# export BLUE="\[\e[0;34m\]"
# export LIGHT_CYAN="\[\e[0;36m\]"
# export BR_YELLOW="\[\e[1;33m\]"
# export DK_YELLOW="\[\e[0;33m\]"
# export DK_GREEN="\[\e[0;32m\]"
# export LIGHT_GREEN="\[\e[1;32m\]"
# export PERIWINKLE="\[\e[1;35m\]"
# export MAGENTA="\[\e[0;35m\]"

export BOLD_ON="\[\e[1m\]"
export BOLD_OFF="\[\e[22m\]"
export INVERSE_ON="\[\e[7m\]"
export INVERSE_OFF="\[\e[27m\]"
export ITALICS_ON="\[\e[3m\]"
export ITALICS_OFF="\[\e[23m\]"
export STRIKETHROUGH_ON="\[\e[9m\]"
export STRIKETHROUGH_OFF="\[\e[29m\]"
export UNDERLINE_ON="\[\e[4m\]"
export UNDERLINE_OFF="\[\e[24m\]"

export FG_BLACK="\[\e[30m\]"
export FG_BLUE="\[\e[34m\]"
export FG_CYAN="\[\e[36m\]"
export FG_DEFAULT="\[\e[39m\]"
export FG_GREEN="\[\e[32m\]"
export FG_MAGENTA="\[\e[35m\]"
export FG_RED="\[\e[31m\]"
export FG_YELLOW="\[\e[33m\]"
export FG_WHITE="\[\e[37m\]"

export BG_BLACK="\[\e[40m\]"
export BG_BLUE="\[\e[44m\]"
export BG_CYAN="\[\e[46m\]"
export BG_DEFAULT="\[\e[49m\]"
export BG_GREEN="\[\e[42m\]"
export BG_MAGENTA="\]\e[45m\]"
export BG_RED="\[\e[41m\]"
export BG_YELLOW="\[\e[43m\]"
export BG_WHITE="\[\e[47m\]"

export COLOR_RESET="\[\e[0m\]" # reset; clears all colors and styles (to white on black)

export DIVIDER="◤"
export PROMPT="►"

# if [[ "$(uname)" = "Linux" ]]; then
#   export EXTRA_SPACE=" "
# fi
export EXTRA_SPACE=" "

# show * for unstaged and + for uncommitted changes
export GIT_PS1_SHOWDIRTYSTATE=true

# show $ if there are stashed files
export GIT_PS1_SHOWSTASHSTATE=true

# git
if [[ "$(uname -s)" != "Darwin" ]] || [ -z `which brew` ] || [ ! -f $(brew --prefix)/etc/bash_completion ]; then
  source ~/dotfiles/git/git-completion.bash
  source ~/dotfiles/git/git-prompt.sh
fi

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
    echo "ruby-`rbenv local 2> /dev/null || rbenv global 2> /dev/null || echo '???'` "
  fi
}

function node_version {
  if [ -d ~/.nvm ] && [ ! -z "$(type nvm 2> /dev/null)" ]; then
    echo "node-`nvm current | sed 's/v//'`"
  elif [ ! -z `which nodenv` ]; then
    echo "node-`nodenv local 2> /dev/null || nodenv global 2> /dev/null || echo '???'` "
  fi
}

function git_prompt {
  type __git_ps1 &>/dev/null && __git_ps1 "\e[37m⎇  %s "
}

function time_stamp {
  echo `date "+%Y.%m.%d %H:%M:%S %Z"`
}

# setting the console prompt
export PS1="\
$ITALICS_ON${FG_BLUE}\
...completed at $(echo '$(time_stamp)') ⇪\
$ITALICS_OFF\n\n\
$BG_BLUE$FG_WHITE \u@\h \
$BG_RED$FG_BLUE$DIVIDER\
$BG_RED$FG_WHITE$EXTRA_SPACE\
$(echo '$(rbenv_version)')\
$BG_GREEN$FG_RED$DIVIDER\
$BG_GREEN$FG_WHITE$EXTRA_SPACE$(echo '$(node_version)')\
$BG_CYAN$FG_GREEN$DIVIDER\
$BG_CYAN$FG_WHITE$EXTRA_SPACE$(echo '$(git_prompt)')\
$BG_DEFAULT$FG_CYAN$DIVIDER\
$FG_DEFAULT\
$(echo '$(format_dirs)')\
\n\
$BG_DEFAULT$FG_BLUE[0] \w/ \
$FG_YELLOW$PROMPT$BOLD_OFF\
$FG_DEFAULT "

