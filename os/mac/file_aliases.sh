# mac's ls don't like --params
alias ls='ls -hFG'
alias dir='ls -lhFGT'
alias lS='ls -FalSG'

# once in a while I want to see hidden files in the finder
# (e.g. when I want to restore one using time machine)
alias finder_show_hidden='defaults write com.apple.Finder AppleShowAllFiles YES; killall Finder'
alias finder_hide_hidden='defaults write com.apple.Finder AppleShowAllFiles NO; killall Finder'

alias spoken_rspec="rspec --no-color --format=progress spec | grep failures | sed 's/.*examples\, //' | sed 's/0/no/' | say &"

# ruby development shortcuts
# added with the TestDoublers

alias e="subl -n ."
alias mate="subl"

# tmuxinator
if [ -z `which mux` ]; then
  alias mux='tmuxinator'
fi

# open a file in Marked.app (markdown preview)
function marked(){
  if [ -z "$1" ]; then
    open -a marked.app
  else
    open -a marked.app $1
  fi
}

# grep ps aux but still show header row
function paux {
  if [ $2 ]; then
    PATTERN=$2
    PS_ARGS=$1
  elif [ $1 ]; then
    PATTERN=$1
    PS_ARGS=u
  else
    echo " pgrep: grep a process list but keep the ps headers."
    echo
    echo " USAGE:"
    echo "   pgrep <pattern>"
    echo "   pgrep <psarg> <pattern>"
    echo
    echo " If no psarg is given, it will default to 'u'."
  fi

  if [ $PATTERN ]; then
    ps $PS_ARGS | head -n1
    ps $PS_ARGS | grep $PATTERN | grep -v grep | grep --color $PATTERN
  fi
}
