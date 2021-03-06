
HISTCONTROL=ignoredups

export EDITOR=vim

source ~/dotfiles/os/common/file_aliases.sh
source ~/dotfiles/ui/file_aliases.sh
source ~/dotfiles/git/git_aliases.sh

# source private (read "custom") scripts
sourceScriptsInDir () {
  sourceDir=$1
  if [ "$VERBOSE" == "1" ]; then
    echo "sourcing *.sh in $sourceDir..."
  fi

  for file in $sourceDir/*.sh; do
    if [ "$VERBOSE" == "1" ]; then
      echo " - $file"
    fi
    if [ -f $file ]; then # hack for Ubuntu bash...
      source $file
    fi
  done

  if [ "$VERBOSE" == "1" ]; then
    echo "All files sourced."
  fi
}

sourceScriptsInDir ~/dotfiles/private
sourceScriptsInDir ~/dotfiles/custom

source ~/dotfiles/ui/ps1.sh
