# mac's ls don't like --params
alias ls='ls -hFG'
alias dir='ls -lhFGT'
alias lS='ls -FalSG'

alias email='pushd ~/vm_shared/grid && ruby lib/login.rb ff && popd'

# once in a while I want to see hidden files in the finder
# (e.g. when I want to restore one using time machine)
alias finder_show_hidden='defaults write com.apple.Finder AppleShowAllFiles YES; killall Finder'
alias finder_hide_hidden='defaults write com.apple.Finder AppleShowAllFiles NO; killall Finder'

# edit right here
alias e="subl -n ."

alias spoken_rspec="rspec --no-color --format=progress spec | grep failures | sed 's/.*examples\, //' | sed 's/0/no/' | say &"

# ruby development shortcuts
# added with the TestDoublers

alias e="subl -n ."
alias mate="subl"

#  ruby/rails
alias be='n bundle exec'

alias rdbm='rake db:migrate db:test:prepare'
alias bers='be rspec --drb'
alias spork2='be spork --port 9090'
alias bers2='RSPEC_DRB=9090 be rspec --drb'

#  comverge
alias zars='NO_BIS=y LOCALE="en-ZA" be rails s'
alias zarc='NO_BIS=y LOCALE="en-ZA" be rails c'

# jump quickly into a project
function proj {
  pushd `env ruby ~/bin/proj.rb $1`
}
