asdf_path="$HOME/.asdf/asdf.sh"
asdf_completions_path="$HOME/.asdf/completions/asdf.bash"

if [ `uname` == "Darwin" ]; then
  prefix=$(brew --prefix asdf)
  asdf_path="$prefix/asdf.sh"
  asdf_completions_path="$prefix/etc/bash_completion.d/asdf.bash"
fi

if [ -f $asdf_path ]; then
  . $asdf_path
fi

if [ -f $asdf_completions_path ]; then
  . $asdf_completions_path
fi
