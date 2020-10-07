if [[ "$(uname -s)" = "Darwin" ]] && [ -f /usr/local/etc/bash_completion ]; then
  source /usr/local/etc/bash_completion
elif [[ $PS1 && -f /usr/share/bash-completion/bash_completion ]]; then
  source /usr/share/bash-completion/bash_completion
fi
