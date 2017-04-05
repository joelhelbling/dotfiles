if [[ "$(uname -s)" = "Darwin" ]] &&
  [ ! -z `which brew` ] &&
  [ -f $(brew --prefix)/etc/bash_completion ]; then

  source $(brew --prefix)/etc/bash_completion
fi
