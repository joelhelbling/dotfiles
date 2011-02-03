
# source this file from ~/.profile

# load up the stuff we use
source ~/dotfiles/file_aliases.sh
source ~/dotfiles/git/git_aliases.sh
source ~/dotfiles/ps1.sh
source ~/dotfiles/nw_proxy.sh
source ~/dotfiles/mingw/ruby_switcher.sh

# setup our ruby aliases
alias ruby192='use_ruby ruby 1.9.2'
alias jruby152='use_ruby jruby 1.5.2'
alias jruby153='use_ruby jruby 1.5.3'
alias jruby155='use_ruby jruby 1.5.5'
alias jruby160='use_ruby jruby 1.6.0'

# we'll start with ruby 1.9.2
ruby192

# handy aliases
alias gomavs='cd /c/dev/mavericks'
alias gogit='gomavs && cd git-svn'
