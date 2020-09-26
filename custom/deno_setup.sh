if [ ! -z `which deno` ]; then
  deno_bin_path=$(realpath `deno info | grep DENO_DIR | cut -d ' ' -f 3 | sed 's/\"//g'`/../../.deno/bin)
  export PATH=$deno_bin_path:$PATH
fi
