# colors
export GRAY="\e[1;30m"
export CYAN="\e[1;36m"
export BR_YELLOW="\e[1;33m"
export DK_YELLOW="\e[0;33m"
export DK_GREEN="\e[0;32m"
export NORMAL_COLOR='\e[m'

# git completion
export GIT_PS1_SHOWDIRTYSTATE=true
source ~/dotfiles/git/git-completion.bash

# setting the console prompt
export PS1=' \e[1;33m\w\e[m$(type __git_ps1 &>/dev/null && __git_ps1 "$DK_GREEN<%s>") \e[1;36m::\e[m '

