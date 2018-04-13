if [ ! -z `which docker` ]; then
  alias dcls='docker container list'
  alias dcla='docker container list --all'
  alias dx='docker exec -it'
  alias dlog='docker logs -f'
fi
