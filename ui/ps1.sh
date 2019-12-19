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

export DIVIDER="▞"
export PROMPT="::"

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
  if [ ! -z `which asdf` ]; then
    echo "rb:`asdf current ruby | cut -d ' ' -f 1` "
  elif [ ! -z `which rbenv` ]; then
    echo "rb:`rbenv version-name 2> /dev/null || echo '???'` "
  fi
}

function node_version {
  if [ ! -z `which asdf` ]; then
    echo "nd:`asdf current nodejs | cut -d ' ' -f 1` "
  elif [ ! -z `which nodenv` ]; then
    echo "nd:`nodenv version-name 2> /dev/null || echo '???'` "
  elif [ -d ~/.nvm ] && [ ! -z "$(type nvm 2> /dev/null)" ]; then
    echo "nd:`nvm current | sed 's/v//'`"
  else
    echo 'nd: ???'
  fi
}

function git_prompt {
  type __git_ps1 &>/dev/null && __git_ps1 "\e[36m⎇  %s"
}

function time_stamp {
  offset=`expr $(tput cols) - 0`
  stamp=`date "+%Y.%m.%d %H:%M:%S %Z "`
  printf '%*s%s' $offset "$stamp"
}

if [ "`type -t iterm2_prompt_mark`" == "" ]; then
  iterm2_prompt_mark() {
    echo ">"
  }
fi

# setting the console prompt
export PS1="\n\
$ITALICS_ON$BG_DEFAULT$FG_DEFAULT\
`echo '$(time_stamp)'`\
$BG_DEFAULT$ITALICS_OFF\n\
$BG_BLUE$FG_WHITE @\h \
$BG_RED$FG_BLUE$DIVIDER\
$BG_RED$FG_WHITE$EXTRA_SPACE\
`echo '$(rbenv_version)'`\
$BG_GREEN$FG_RED$DIVIDER\
$BG_GREEN$FG_WHITE$EXTRA_SPACE\
`echo '$(node_version)'`\
$BG_DEFAULT$FG_GREEN$DIVIDER\
$FG_DEFAULT\
`echo '$(format_dirs)'`\
\n\
\[$(iterm2_prompt_mark)\]\
$BG_DEFAULT$FG_BLUE[0] \w/ \
`echo '$(git_prompt)'` \
$FG_YELLOW$PROMPT$BOLD_OFF\
$FG_DEFAULT "

