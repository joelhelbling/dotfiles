
HISTCONTROL=ignoredups

export EDITOR=vim

source ~/dotfiles/ui/ps1.sh
source ~/dotfiles/ui/file_aliases.sh
source ~/dotfiles/git/git_aliases.sh

echo "HERE WE GO (verbose: $VERBOSE)"

# source private (read "custom") scripts
if [ $VERBOSE -ge 1 ]; then
  echo "sourcing private files..."
fi

for file in ~/dotfiles/private/*.sh; do
  if [ $VERBOSE -ge 1 ]; then
    echo " - $file"
  fi
  source $file
done

if [ $VERBOSE -ge 1 ]; then
  echo "All files sourced."
fi

