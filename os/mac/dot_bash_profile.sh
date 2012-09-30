export JRUBY_HOME=/opt/local/share/java/jruby
export RUBYOPT='-rubygems'
export PATH=/usr/local/bin:/usr/local/sbin:$PATH:/Users/joelhelbling/bin
export VIM_APP_DIR=/Applications/editors
export PROJECT_DIR=$HOME/dev

# load up the stuff we use
source ~/dotfiles/ui/ps1.sh
source ~/dotfiles/ui/file_aliases.sh
source ~/dotfiles/os/mac/file_aliases.sh
source ~/dotfiles/git/git_aliases.sh

# some rvm setup
if [[ -s /Users/joelhelbling/.rvm/scripts/rvm ]] ; then
  source /Users/joelhelbling/.rvm/scripts/rvm
fi

HISTCONTROL=ignoredups
