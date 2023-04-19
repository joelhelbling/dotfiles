# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
if [ -f "/home/joelhelbling/miniconda3/bin/conda" ]; then
  __conda_setup="$('/home/joelhelbling/miniconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
  if [ $? -eq 0 ]; then
      eval "$__conda_setup"
  else
      if [ -f "/home/joelhelbling/miniconda3/etc/profile.d/conda.sh" ]; then
          . "/home/joelhelbling/miniconda3/etc/profile.d/conda.sh"
      else
          export PATH="$PATH:/home/joelhelbling/miniconda3/bin"
      fi
  fi
  unset __conda_setup
fi
# <<< conda initialize <<<


