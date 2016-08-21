
HISTCONTROL=ignoredups

export EDITOR=vim

# load up the stuff we use
source ~/dotfiles/ui/ps1.sh
source ~/dotfiles/ui/file_aliases.sh
source ~/dotfiles/git/git_aliases.sh

# source private (read "custom") scripts
if ls ~/dotfiles/.private/* 1> /dev/null 2>&1; then
  if [ $VERBOSE -ge 1 ]; then
    echo "sourcing private files..."
  fi

  for file in ~/dotfiles/.private/*; do
    source $file

    if [ $VERBOSE -ge 1 ]; then
      echo " - $file"
    fi
  done

  if [ $VERBOSE -ge 1 ]; then
    echo "All files sourced."
  fi
fi

