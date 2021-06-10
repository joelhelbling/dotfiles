if [ ! -z `which keybase` ]; then
  KEYBASE_BINARY=`which keybase`
  alias kb="${KEYBASE_BINARY}"
  alias kbg="${KEYBASE_BINARY} git"
  alias kbfs="${KEYBASE_BINARY} fs"
  alias kbkv="${KEYBASE_BINARY} kvstore"
fi
