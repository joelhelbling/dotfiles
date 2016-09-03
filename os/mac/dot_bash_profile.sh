VERBOSE=0

source ~/dotfiles/os/common/dot_bash_profile.sh
source ~/dotfiles/os/mac/file_aliases.sh

export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.7.0_21.jdk/Contents/Home
export RUBYOPT='-rubygems'
export PROJECT_DIR=$HOME/code

export PROMPT_COMMAND='echo -ne "\033]0;${PWD/#$HOME/~}\007"'

export PATH=/usr/local/bin:/usr/local/sbin:$PATH
export PATH=$JAVA_HOME/bin/java:$PATH

