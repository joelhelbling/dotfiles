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

# setting the console prompt
export PS1='${debian_chroot:+($debian_chroot)}\033[01;32m\]\u@\h\[\033[00m\] \e[1;33m\w\e[m$(type __git_ps1 &>/dev/null && __git_ps1 "$DK_GREEN<%s>$NORMAL_COLOR") \e[1;36m::\e[m '

