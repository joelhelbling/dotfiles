#!/bin/sh

source ~/dotfiles/os/common/dot_bash_profile.sh
source ~/dotfiles/os/mingw/file_aliases.sh


# open a file in a web browser (chrome)
export BROWSER=/c/Documents\ and\ Settings/$USER/Local\ Settings/Application\ Data/Google/Chrome/Application/chrome.exe
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
