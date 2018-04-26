# https://github.com/ogham/exa
# https://www.2daygeek.com/exa-a-modern-replacement-for-ls-command-linux/

if [ ! -z `which exa` ]; then
  alias lt='exa -bghHliS'
fi
