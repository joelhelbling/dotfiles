
# source from ~/.profile

source ~/dotfiles/git/git_aliases.sh
source ~/dotfiles/git/git-completion.bash
source ~/dotfiles/file_aliases.sh
source ~/dotfiles/mingw/ruby_switcher.sh
source ~/dotfiles/nw_proxy.sh

alias ruby192='use_ruby ruby 1.9.2'
alias jruby152='use_ruby jruby 1.5.2'
alias jruby153='use_ruby jruby 1.5.3'
alias jruby155='use_ruby jruby 1.5.5'
alias jruby160='use_ruby jruby 1.6.0'

ruby192

export PS1="\e[0;33m[ \e[1;33m\w \e[0;33m$(__git_ps1)]$\e[m#=> "
