
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
fi

# a ruby switcher for MinGW
if [ "$MSYSTEM" == "MINGW32" ]; then
  source ~/dotfiles/os/mingw/ruby_switcher.sh

  # setup our ruby aliases
  alias ruby192='use_ruby ruby 1.9.2'
  alias jruby152='use_ruby jruby 1.5.2'
  alias jruby153='use_ruby jruby 1.5.3'
  alias jruby155='use_ruby jruby 1.5.5'
  alias jruby160='use_ruby jruby 1.6.0.RC1'
  alias jruby160RC2='use_ruby jruby 1.6.0.RC2'

fi

# open a file in a web browser (chrome)
export BROWSER=/c/Documents\ and\ Settings/helbinj/Local\ Settings/Application\ Data/Google/Chrome/Application/chrome.exe
function webopen() {
  "$BROWSER" $1/$2
}
alias web='webopen `pwd`'

# I don't know why putting this in a different
# block, but it does, so I do.
if [ "$MSYSTEM" == "MINGW32" ]; then
  # we'll start with ruby 1.9.2
  ruby192
fi
