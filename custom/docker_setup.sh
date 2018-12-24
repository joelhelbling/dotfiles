if [ ! -z `which docker` ]; then
  alias dcls='docker container list'
  alias dcla='docker container list --all'
  alias dx='docker exec -it'
  alias dlog='docker logs -f'
fi

if [ ! -z `which docker-compose` ]; then
  alias dc='docker-compose'
  alias dcps='docker-compose ps'
  alias dcx='docker-compose exec'
fi
