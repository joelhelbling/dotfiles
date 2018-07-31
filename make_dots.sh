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

  # .gitconfig
  if [ -f ~/.gitconfig ]; then
    rm -f ~/.gitconfig
  fi
  ln -s ~/dotfiles/git/gitconfig ~/.gitconfig

  # .gitignore
  if [ -f ~/.gitignore ]; then
    rm -f ~/.gitignore
  fi
  ln -s ~/dotfiles/git/gitignore ~/.gitignore

  # .tmux.conf
  if [ -f ~/.tmux.conf ]; then
    rm -f ~/.tmux.conf
  fi
  ln -s ~/dotfiles/tmux/tmux.conf ~/.tmux.conf

  # .rspec
  if [ -f ~/.rspec ]; then
    rm -f ~/.rspec
  fi
  ln -s ~/dotfiles/rspec/dot_rspec ~/.rspec
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
  PROFILE=~/.bash_profile
  if [ -f ~/.profile ]; then
    PROFILE=~/.profile
  fi

  if grep -q "dotfiles" $PROFILE
  then
    sed -i 's/source ~\/dotfiles.*/source ~\/dotfiles\/os\/ubuntu\/dot_bash_profile\.sh/g' $PROFILE
  else
    echo "" >> $PROFILE
    echo "source ~/dotfiles/os/ubuntu/dot_bash_profile.sh" >> $PROFILE
    echo "" >> $PROFILE
  fi

  # .gitconfig
  if [ -f ~/.gitconfig ]; then
    rm -f ~/.gitconfig
  fi
  ln -s ~/dotfiles/git/gitconfig ~/.gitconfig

  # .gitignore
  if [ -f ~/.gitignore ]; then
    rm -f ~/.gitignore
  fi
  ln -s ~/dotfiles/git/gitignore ~/.gitignore

  # .tmux.conf
  if [ -f ~/.tmux.conf ]; then
    rm -f ~/.tmux.conf
  fi
  ln -s ~/dotfiles/tmux/tmux.conf ~/.tmux.conf

  if [ -f ~/.ssh/rc ]; then
    mv ~/.ssh/rc ~/.ssh/rc-old
  fi
  ln -s ~/dotfiles/tmux/sshrc ~/.ssh/rc

  # .rspec
  if [ -f ~/.rspec ]; then
    rm -f ~/.rspec
  fi
  ln -s ~/dotfiles/rspec/dot_rspec ~/.rspec
;;
*)
  echo "Don't know how to setup dot files for $1"
;;
esac
