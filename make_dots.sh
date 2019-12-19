#!/bin/bash

case `uname` in
"Darwin")
  echo "Making dot files for Mac"

  # .profile
  echo "source ~/dotfiles/os/mac/dot_bash_profile.sh" > ~/.bash_profile
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

  # terminal
  tic ui/xterm-256color-italic.terminfo
;;
*)
  echo "Don't know how to setup dot files for $1"
;;
esac

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
if [ -f ~/.rspec -o -L ~/.rspec ]; then
  rm -f ~/.rspec
fi
ln -s ~/dotfiles/ruby/dot_rspec ~/.rspec

# .gemrc
if [ -f ~/.gemrc -o -L ~/.gemrc ]; then
  rm -f ~/.gemrc
fi
ln -s ~/dotfiles/ruby/dot_gemrc ~/.gemrc

# .asdfrc
if [ -f ~/.asdfrc -o -L ~/.asdfrc ]; then
  rm -f ~/.asdfrc
fi
ln -s ~/dotfiles/asdf/dot_asdfrc ~/.asdfrc


# tmuxinator default template
if [ -d ~/.config/tmuxinator ]; then
  if [ -f ~/.config/tmuxinator/default.yml ]; then
    rm -f ~/.config/tmuxinator/default.yml
  fi
  ln -s ~/dotfiles/tmux/tmuxinator_default.yml ~/.config/tmuxinator/default.yml
fi

