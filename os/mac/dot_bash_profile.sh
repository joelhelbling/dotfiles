VERBOSE=0
export BASH_SILENCE_DEPRECATION_WARNING=1

source ~/dotfiles/os/common/dot_bash_profile.sh
source ~/dotfiles/os/mac/file_aliases.sh

export PROJECT_DIR=$HOME/code

export PROMPT_COMMAND='echo -ne "\033]0;${PWD/#$HOME/~}\007"'
