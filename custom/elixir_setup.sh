if [ ! -z `which elixir` ]; then
  export ERL_AFLAGS="-kernel shell_history enabled"
fi
