#!/bin/bash

function make_vimrc {
  TARGET=$1
  VIMFILES=$2

  echo "TARGET: $TARGET"
  echo "VIMFILES: $VIMFILES"
  # .vimrc
  echo "
\" first load akitaonrails vimrc
source ~/$VIMFILES/vimrc

\" now load my custom vim settings
source ~/dotfiles/vim/vimrc" > $TARGET

}

case "$1" in
"mac")
  echo "Making dot files for Mac"
  # not sure offhand how to make the dotfiles for mac...
  # I'll do this later when I'm on my mac

  # .gitignore
  ln -s git/gitignore ../.gitignore
;;
"mingw")
  echo "Making dot files for MinGW"

  # .profile
  echo "source ~/dotfiles/os/mingw/dot_profile.sh" > ~/.profile

  # _vimrc
  make_vimrc '../_vimrc' 'vimfiles'

  # .gitignore
  cp git/gitignore ../.gitignore
;;
"ubuntu")
  echo "Making dot files for Ubuntu"

  # .profile
  sed -i 's/source ~\/dotfiles.*/source ~\/dotfiles\/os\/ubuntu\/dot_profile\.sh/g' ~/.profile

  # .vimrc
  make_vimrc '../.vimrc' '.vim'

  # .gitignore
  ln -s ~/dotfiles/git/gitignore ../.gitignore
;;
*)
  echo "Don't know how to setup dot files for $1"
;;
esac

