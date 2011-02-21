# mac's ls don't like --params
alias ls='ls -hFG'
alias dir='ls -lhFGT'
alias lS='ls -FalSG'

# old habits die hard!  Just give up!
alias gvim='mvim'

# once in a while I want to see hidden files in the finder
# (e.g. when I want to restore one using time machine)
alias finder_show_hidden='defaults write com.apple.Finder AppleShowAllFiles YES; killall Finder'
alias finder_hide_hidden='defaults write com.apple.Finder AppleShowAllFiles NO; killall Finder'
