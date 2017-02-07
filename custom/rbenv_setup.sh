if [ ! -z `which rbenv` ] && [ -d ~/.rbenv/shims ]; then
  export PATH=~/.rbenv/shims:$PATH
fi
