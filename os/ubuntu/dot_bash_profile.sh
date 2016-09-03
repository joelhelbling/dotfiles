
source ~/dotfiles/os/common/dot_bash_profile.sh
source ~/dotfiles/os/ubuntu/file_aliases.sh

alias mvim="UBUNTU_MENUPROXY= gvim"

eval 'dircolors ~/dotfiles/os/ubuntu/dircolors.ansi-dark' > /dev/null

if [ -f ~/.local/lib/python2.7/site-packages/powerline/bindings/bash/powerline.sh ]; then
  source ~/.local/lib/python2.7/site-packages/powerline/bindings/bash/powerline.sh
fi

if [ -d ~/.luarocks/bin ]; then
  export PATH=~/.luarocks/bin:$PATH
fi
