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
FG_GREY="\[\e[90m\]"

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

declare -A lang_fg=(        \
  ["default"]="$FG_DEFAULT" \
  ["host"]="$BOLD_ON$ITALICS_ON$FG_WHITE" \
  ["ruby"]="$FG_WHITE"      \
  ["nodejs"]="$FG_WHITE"    \
  ["deno"]="$FG_BLACK"      \
  ["git"]="$FG_WHITE"       \
)
declare -A lang_bg=(        \
  ["default"]="$BG_DEFAULT" \
  ["host"]="$BG_BLUE"       \
  ["ruby"]="$BG_RED"        \
  ["nodejs"]="$BG_GREEN"    \
  ["deno"]="$BG_WHITE"      \
  ["git"]="$BG_MAGENTA"     \
)
declare -A lang_fg_alt=(    \
  ["default"]="$FG_BLACK"   \
  ["host"]="$FG_BLUE$BOLD_OFF$ITALICS_OFF" \
  ["ruby"]="$FG_RED"        \
  ["nodejs"]="$FG_GREEN"    \
  ["deno"]="$FG_WHITE"      \
  ["git"]="$FG_MAGENTA"     \
)
declare -A lang_abbr=( \
  ["ruby"]="rb"        \
  ["nodejs"]="nd"      \
  ["deno"]="🦕"        \
)

DIVIDER="▞"
# PROMPT="|>"
PROMPT="💠"

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
         sort -r            | \
         sed "s@^ @@g"      | \
         sed "s@  @@g"      | \
         sed "s@[0-9]@<&>::@" )
}

function prettify {
  echo $1 | sed "s@\:\:@ @g"
}

function format_dirs {
  for DER in `dir_stack`; do
    if [[ "$DER" =~ "<0>::" ]]; then
      DER=""
    fi
    echo " $(prettify $DER)"
  done
}

function display_dirs {
  echo "\
$BG_DEFAULT$FG_GREY$ITALICS_ON\
`echo '$(format_dirs)'`\
$ITALICS_OFF\
"
}

function display_time {
  echo "\
$ITALICS_ON$BG_DEFAULT$FG_DEFAULT\
`echo '$(time_stamp)'`\
$BG_DEFAULT$ITALICS_OFF\
"
}

function lang_display {
  lang=$1
  if [ "$lang" == "default" ]; then
    echo ""
  elif [ "$lang" == "host" ]; then
    echo "@\h "
  elif [ "$lang" == "git" ]; then
    echo "🐙 `echo '$(git_prompt)'` "
  elif [ ! -z `which asdf` ] && [ ! -z "`asdf plugin list | grep $lang`" ]; then
    echo "${lang_abbr[$lang]}:`asdf current $lang | sed 's/\s\+/ /g' | cut -d ' ' -f 2` "
  fi
}

function git_prompt {
  type __git_ps1 &>/dev/null && __git_ps1 "\e[37m⎇  %s"
}

function time_stamp {
  offset=`expr $(tput cols) - 0`
  stamp=`date "+%Y.%m.%d %H:%M:%S %Z "`
  printf '%*s%s' $offset "$stamp"
}

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
  echo "$(transition_divider $from $tew)$(colors_for_lang $tew)$(lang_display $tew)"
}

# setting the console prompt
export PS1="\
\n\
`display_time `\
\n\
`transition_lang "default" "host"`\
`transition_lang "host" "ruby"`\
`transition_lang "ruby" "nodejs"`\
`transition_lang "nodejs" "deno"`\
`transition_lang "deno" "git"`\
`transition_lang "git" "default"`\
\n\
`display_dirs`\
$BG_DEFAULT$FG_BLUE$BOLD_ON[0] \w/ \
$FG_YELLOW$PROMPT\
$COLOR_RESET "

