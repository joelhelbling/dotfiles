# https://github.com/ogham/exa
# https://www.2daygeek.com/exa-a-modern-replacement-for-ls-command-linux/

if [ ! -z `which exa` ]; then
  alias lt='exa -bghHliS'
  alias ls='exa --long --git'
  alias ll='ls -a'
  alias tree='ls --tree'
else
  alias ls='ls -hFG'
  alias ll='ls -l'
fi
