#!/bin/sh

# source this file from ~/.profile

# load up the stuff we use
source ~/dotfiles/ui/ps1.sh
source ~/dotfiles/ui/file_aliases.sh
source ~/dotfiles/git/git_aliases.sh

if [ "$USERDOMAIN" == "NWIE" ]; then
  # setup proxy server
  source ~/dotfiles/proxy/proxy.sh

  # handy aliases
  alias gomavs='cd /c/dev/mavericks'
  alias gogit='gomavs && cd git-svn'
  alias gonavs='cd /c/dev/navigators'
fi

alias mvim='gvim'

# a ruby switcher for MinGW
if [ "$MSYSTEM" == "MINGW32" ]; then
  source ~/dotfiles/os/mingw/ruby_switcher.sh

  # setup our ruby aliases
  alias ruby193='use_ruby ruby 193'
  alias jruby166='use_ruby jruby 166'

fi

# open a file in a web browser (chrome)
export BROWSER=/c/Documents\ and\ Settings/helbinj/Local\ Settings/Application\ Data/Google/Chrome/Application/chrome.exe
function webopen() {
  "$BROWSER" $1/$2
}
alias web='webopen `pwd`'

# I don't know why putting this in a different
# block makes it work, but it does, so I do.
if [ "$MSYSTEM" == "MINGW32" ]; then
  # we'll start with ruby 1.9.3
  ruby193
fi

export RUBYOPT='-rubygems'
export PATH=$PATH:/c/ruby_devkit/bin

export CUCUMBER_OUTPUT_ENCODING=cp1252
alias rvm-prompt='active_ruby'
