
if [ -d $HOME/.asdf ]; then
  if [ -f $HOME/.asdf/asdf.sh ]; then
    . $HOME/.asdf/asdf.sh
  fi

  if [ -f $HOME/.asdf/completions/asdf.bash ]; then
    . $HOME/.asdf/completions/asdf.bash
  fi
fi
