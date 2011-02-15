#!/bin/bash

case "$1" in
"mac")
  echo "It's a Mac!"
;;
"mingw")
  # .profile
  echo "source ~/dotfiles/os/mingw/dot_profile.sh" > ~/.profile

  # _vimrc
  echo '
" first load akitaonrails vimrc
source ~/vimfiles/vimrc

" now load my custom MinGW vim settings
source ~/dotfiles/vim/vimrc' > ~/_vimrc
;;
"ubuntu")
  # .profile
  sed -i 's/source ~\/dotfiles.*//g' ~/.profile
  echo 'source ~/dotfiles/os/ubuntu/dot_profile.sh' >> ~/.profile

  # .vimrc
  echo '
" first load akitaonrails vimrc
source ~/.vim/vimrc

" now load my custom vim settings
source ~/dotfiles/vim/vimrc' > ~/.vimrc
;;
*)
  echo "Don't know how to setup dot files for $1"
;;
esac
