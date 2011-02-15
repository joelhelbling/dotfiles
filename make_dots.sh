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
  echo "Hi, 'Buntu!"
;;
*)
  echo "No idea."
;;
esac
