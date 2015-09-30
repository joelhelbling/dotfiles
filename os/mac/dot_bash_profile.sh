export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.7.0_21.jdk/Contents/Home
export JRUBY_HOME=/opt/local/share/java/jruby
export RUBYOPT='-rubygems'
export PATH=/usr/local/bin:/usr/local/sbin:$PATH:/Users/joelhelbling/bin
export VIM_APP_DIR=$HOME/Applications
export PROJECT_DIR=$HOME/code
export EDITOR=vim

# load up the stuff we use
source ~/dotfiles/ui/ps1.sh
source ~/dotfiles/ui/file_aliases.sh
source ~/dotfiles/os/mac/file_aliases.sh
source ~/dotfiles/git/git_aliases.sh

# AWS
export EC2_HOME=~/.ec2
export PATH=$PATH:$EC2_HOME/bin
# export JAVA_HOME=/System/Library/Frameworks/JavaVM.framework/Home/
# export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_11.jdk/Contents/Home
export PATH=$JAVA_HOME/bin/java:$PATH

# some rvm setup
if [[ -s /Users/joelhelbling/.rvm/scripts/rvm ]] ; then
  source /Users/joelhelbling/.rvm/scripts/rvm
fi

HISTCONTROL=ignoredups

source ~/dotfiles/.private/*
