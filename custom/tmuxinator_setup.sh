if [ ! -z `which tmuxinator` ]; then
  tmuxinator() {
    env TERM=screen-256color tmuxinator $@
  }

  alias mux=tmuxinator
fi
