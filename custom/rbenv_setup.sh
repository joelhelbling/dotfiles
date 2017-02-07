if [ -d ~/.rbenv/bin ] && [ -z `which rbenv` ]; then
  export PATH=~/.rbenv/bin:$PATH
  eval "$(rbenv init -)"
fi

if [ ! -z `which rbenv` ] && [ -d ~/.rbenv/shims ]; then
  export PATH=~/.rbenv/shims:$PATH
fi
