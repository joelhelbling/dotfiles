#!/bin/bash

BOLD_ON="\[\e[1m\]"
BOLD_OFF="\[\e[22m\]"
INVERSE_ON="\[\e[7m\]"
INVERSE_OFF="\[\e[27m\]"
ITALICS_ON="\[\e[3m\]"
ITALICS_OFF="\[\e[23m\]"
STRIKETHROUGH_ON="\[\e[9m\]"
STRIKETHROUGH_OFF="\[\e[29m\]"
UNDERLINE_ON="\[\e[4m\]"
UNDERLINE_OFF="\[\e[24m\]"

FG_BLACK="\[\e[30m\]"
FG_BLUE="\[\e[34m\]"
FG_CYAN="\[\e[36m\]"
FG_DEFAULT="\[\e[39m\]"
FG_GREEN="\[\e[32m\]"
FG_MAGENTA="\[\e[35m\]"
FG_RED="\[\e[31m\]"
FG_YELLOW="\[\e[33m\]"
FG_WHITE="\[\e[37m\]"

BG_BLACK="\[\e[40m\]"
BG_BLUE="\[\e[44m\]"
BG_CYAN="\[\e[46m\]"
BG_DEFAULT="\[\e[49m\]"
BG_GREEN="\[\e[42m\]"
BG_MAGENTA="\]\e[45m\]"
BG_RED="\[\e[41m\]"
BG_YELLOW="\[\e[43m\]"
BG_WHITE="\[\e[47m\]"

COLOR_RESET="\[\e[0m\]" # reset; clears all colors and styles (to white on black)

DIVIDER="▞"
PROMPT="::"

EXTRA_SPACE=" "

# show * for unstaged and + for uncommitted changes
GIT_PS1_SHOWDIRTYSTATE=true

# show $ if there are stashed files
GIT_PS1_SHOWSTASHSTATE=true

# git bash completion
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
  for DER in `dir_stack`; do
    echo $(prettify $DER)
  done
}

declare -A lang_fg=(        \
  ["default"]="$FG_DEFAULT" \
  ["host"]="$BOLD_ON$ITALICS_ON$FG_WHITE"      \
  ["ruby"]="$FG_WHITE"      \
  ["nodejs"]="$FG_WHITE"    \
)
declare -A lang_bg=(        \
  ["default"]="$BG_DEFAULT" \
  ["host"]="$BG_BLUE"       \
  ["ruby"]="$BG_RED"        \
  ["nodejs"]="$BG_GREEN"    \
)
declare -A lang_fg_alt=(    \
  ["default"]="$FG_DEFAULT" \
  ["host"]="$FG_BLUE$BOLD_OFF$ITALICS_OFF"       \
  ["ruby"]="$FG_RED"        \
  ["nodejs"]="$FG_GREEN"    \
)

function ruby_version {
  if [ ! -z `which asdf` ] && [ ! -z "`asdf plugin list | grep ruby`" ]; then
    echo "rb:`asdf current ruby | sed 's/\s\+/ /g' | cut -d ' ' -f 2` "
  elif [ ! -z `which rbenv` ]; then
    echo "rb:`rbenv version-name 2> /dev/null || echo '???'` "
  fi
}

function nodejs_version {
  if [ ! -z `which asdf` ] && [ ! -z "`asdf plugin list | grep nodejs`" ]; then
    echo "nd:`asdf current nodejs | sed 's/\s\+/ /g' | cut -d ' ' -f 2` "
  elif [ ! -z `which nodenv` ]; then
    echo "nd:`nodenv version-name 2> /dev/null || echo '???'` "
  elif [ -d ~/.nvm ] && [ ! -z "$(type nvm 2> /dev/null)" ]; then
    echo "nd:`nvm current | sed 's/v//'`"
  else
    echo 'nd: ???'
  fi
}

function default_version {
  echo ""
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

function colors_for_lang {
  lang=$1
  echo "${lang_bg[$lang]}${lang_fg[$lang]}$EXTRA_SPACE"
}

function transition_divider {
  from=$1
  tew=$2
  echo "${lang_bg[$tew]}${lang_fg_alt[$from]}$DIVIDER"
}

function transition_lang {
  from=$1
  tew=$2
  echo "$(transition_divider $from $tew)$(colors_for_lang $tew)$(${tew}_version)"
}

# setting the console prompt
export PS1="\n\
$ITALICS_ON$BG_DEFAULT$FG_DEFAULT\
`echo '$(time_stamp)'`\
$BG_DEFAULT$ITALICS_OFF\n\
`colors_for_lang "host"`\
@\h \
`transition_lang "host" "ruby"`\
`transition_lang "ruby" "nodejs"`\
`transition_lang "nodejs" "default"`\
`echo '$(format_dirs)'`\
\n\
\[$(iterm2_prompt_mark)\]\
$BG_DEFAULT$FG_BLUE[0] \w/ \
`echo '$(git_prompt)'` \
$FG_YELLOW$PROMPT$BOLD_OFF\
$FG_DEFAULT "

