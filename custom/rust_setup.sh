if [ -d "$HOME/.cargo/bin" ]; then
  export PATH=$HOME/.cargo/bin:$PATH
fi

if [ ! -z `which asdf` ] &&
   [ ! -z "`asdf plugin list | grep rust`" ] &&
   [ ! -z "`asdf current rust 2> /dev/null`" ]; then
  source `asdf where rust`/env
fi
