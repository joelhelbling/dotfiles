
source ~/dotfiles/os/common/dot_bash_profile.sh
source ~/dotfiles/os/ubuntu/file_aliases.sh

eval 'dircolors ~/dotfiles/os/ubuntu/dircolors.ansi-dark' > /dev/null

if [ -f ~/.local/lib/python2.7/site-packages/powerline/bindings/bash/powerline.sh ]; then
  source ~/.local/lib/python2.7/site-packages/powerline/bindings/bash/powerline.sh
fi

if [ -f ~/.ssh/saveagent ]; then
  source ~/.ssh/saveagent
fi
