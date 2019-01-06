tach() {
  if [ -z "$TMUX_DEFAULT_SOCKET" ]; then
    echo "You must set TMUX_DEFAULT_SOCKET"
  else
    tmux -L $TMUX_DEFAULT_SOCKET attach
  fi
}
