if [ ! -z `which tmuxp` ]; then
  # alias tml='tmuxp load .'
  tml() {
    if [ -f "./.tmuxp.yaml" ]; then
      tmuxp load .
    else
      echo "There is no .tmuxp.yaml file here, try typing 'tmi'"
    fi
  }
  tmi() {
    tmuxp_file="./.tmuxp.yaml"
    if [ ! -f "$tmuxp_file" ]; then
      start_directory=$(pwd)
      session_name=$(basename $start_directory)
      cat <<YAML > $tmuxp_file
session_name: $session_name
start_directory: $start_directory
windows:
  - window_name: editor
    panes:
      - vim
  - window_name: shell
    panes:
      - null
YAML
    fi
    tmuxp load .
  }
fi
