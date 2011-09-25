#!/bin/sh

# source this file from ~/.profile

# load up the stuff we use
source ~/dotfiles/ui/ps1.sh
#source ~/dotfiles/ui/file_aliases.sh
#source ~/dotfiles/git/git_aliases.sh

if [ "$USERDOMAIN" == "NWIE" ]; then
  # setup proxy server
  source ~/dotfiles/proxy/proxy.sh

  # handy aliases
  alias gomavs='cd /cygdrive/c/dev/mavericks'
  alias gonavs='cd /cygdrive/c/dev/navigators'
fi

alias mvim='gvim'

# open a file in a web browser (chrome)
export BROWSER=/c/Documents\ and\ Settings/helbinj/Local\ Settings/Application\ Data/Google/Chrome/Application/chrome.exe
function webopen() {
  "$BROWSER" $1/$2
}
alias web='webopen `pwd`'

export RUBYOPT='-rubygems'
export PATH=$PATH:/cygdrive/c/ruby_devkit/bin

#export PATH=$( echo $NEW_PATH \
#             | sed 's!:/c/usr/local/wbin!!g' )
#export PATH=$( echo $NEW_PATH \
#             | sed 's!:/c/Program\ Files/Lotus/Notes!!g' )
#export PATH=$( echo $NEW_PATH \
#             | sed 's!:/c/Program Files/ThinkPad/ConnectUtilities!!g' )
#export PATH=$( echo $NEW_PATH \
#             | sed 's!:/c/Program Files/CA/SharedComponents/PEC/bin!!g' )
#export PATH=$( echo $NEW_PATH \
#             | sed 's!:/c/Program Files/ATI Technologies/ATI.ACE/Core-Static!!g' )
#export PATH=$( echo $NEW_PATH \
#             | sed 's!:/c/Program Files/Common Files/Lenovo!!g' )
#export PATH=$( echo $NEW_PATH \
#             | sed 's!:/c/Program Files/CA/AllFusion Harvest Change Manager!!g' )
#export PATH=$( echo $NEW_PATH \
#             | sed 's!:/c/Program Files/CA/Cryptography/!!g' )

export CUCUMBER_OUTPUT_ENCODING=cp1252
