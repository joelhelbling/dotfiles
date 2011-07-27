#!/bin/bash

function make_vimrc {
  TARGET=$1
  VIMFILES=$2

  echo "TARGET: $TARGET"
  echo "VIMFILES: $VIMFILES"
  # .vimrc
  echo "
\" fix ctags...
let Tlist_Ctags_Cmd = 'c:\\usr\\local\\lib\\ctags58\\ctags.exe'

\" load akitaonrails vimrc
source ~/$VIMFILES/vimrc

\" load my custom vim settings
source ~/dotfiles/vim/vimrc" > $TARGET

}

function make_win_profile {
  echo "
case `uname` in
  \"CYGWIN_NT-5.1\")
    echo "Running cygwin..."
    source ~/dotfiles/os/cygwin/dot_profile.sh
    ;;
  \"MINGW32_NT-5.1\")
    echo "Running mingw..."
    source ~/dotfiles/os/mingw/dot_profile.sh
    ;;
  *)
    echo \"dot profile: I do not understand this OS\"
esac" > ~/.profile
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
  #echo "source ~/dotfiles/os/mingw/dot_profile.sh" > ~/.profile
  make_win_profile

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

