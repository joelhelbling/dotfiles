tach() {
  if [ ! -z "$TMUX_DEFAULT_SOCKET" ]; then
    tmux -L $TMUX_DEFAULT_SOCKET attach
  fi
}
