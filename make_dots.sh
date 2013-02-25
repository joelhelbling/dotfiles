#!/bin/bash

function make_win_profile {
  echo "
case \`uname\` in
  \"CYGWIN_NT-5.1\")
    echo "Running cygwin..."
    export HOME=/home/
    source ~/dotfiles/os/cygwin/dot_profile.sh
    ;;
  \"MINGW32_NT-5.1\")
    echo "Running mingw..."
    source ~/dotfiles/os/mingw/dot_profile.sh
    ;;
  \"MINGW32_NT-6.1\")
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

  # .gitignore
  if [ -f ~/.gitignore ]; then
    rm -f ~/.gitignore
  fi
  ln -s ~/dotfiles/git/gitignore ~/.gitignore
;;
"MINGW32_NT-5.1")
  echo "Making dot files for MinGW (on WindowsXP)"

  # .profile
  #echo "source ~/dotfiles/os/mingw/dot_profile.sh" > ~/.profile
  make_win_profile

  # .gitignore
  cp git/gitignore ../.gitignore
;;
"MINGW32_NT-6.1")
  echo "Making dot files for MinGW (on Windows 7)"
  # .profile
  #echo "source ~/dotfiles/os/mingw/dot_profile.sh" > ~/.profile
  make_win_profile

  # .gitignore
  cp git/gitignore ../.gitignore
;;
"Linux")
  echo "Making dot files for Linux"

  # .bash_profile
  if grep -q "dotfiles" ~/.bash_profile
  then
    sed -i 's/source ~\/dotfiles.*/source ~\/dotfiles\/os\/ubuntu\/dot_bash_profile\.sh/g' ~/.bash_profile
  else
    echo "" >> ~/.bash_profile
    echo "source ~/dotfiles/os/ubuntu/dot_bash_profile.sh" >> ~/.bash_profile
    echo "" >> ~/.bash_profile
  fi

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
