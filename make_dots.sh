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

case `uname` in
"Darwin")
  echo "Making dot files for Mac"

  # .profile
  echo "source ~/dotfiles/os/mac/dot_bash_profile.sh" > ~/.bash_profile

  # .vimrc
  make_vimrc '../.vimrc' '.vim'

  # .gitignore
  if [ -f ~/.gitignore ]; then
    rm -f ~/.gitignore
  fi
  ln -s ~/dotfiles/git/gitignore ~/.gitignore
;;
"MINGW32_NT-5.1")
  echo "Making dot files for MinGW"

  # .profile
  echo "source ~/dotfiles/os/mingw/dot_profile.sh" > ~/.profile

  # _vimrc
  make_vimrc '../_vimrc' 'vimfiles'

  # .gitignore
  cp git/gitignore ../.gitignore
;;
"Linux")
  echo "Making dot files for Linux"

  # .profile
  sed -i 's/source ~\/dotfiles.*/source ~\/dotfiles\/os\/ubuntu\/dot_profile\.sh/g' ~/.profile

  # .vimrc
  make_vimrc '../.vimrc' '.vim'

  # .gitignore
  if [ -f ~/.gitignore ]; then
    rm -f ~/.gitignore
  fi
  ln -s ~/dotfiles/git/gitignore ~/.gitignore
;;
*)
  echo "Don't know how to setup dot files for $1"
;;
esac

