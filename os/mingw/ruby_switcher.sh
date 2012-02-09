
# =================================================================================
# Switching Rubies
#   MinGW is kinda funny when it comes to managing multiple Rubies.  I wasn't
#   able to get either pik (for Windows) or rvm to work in the MinGW environment.
#
#   I wasn't able to get pik or rvm working in Cygwin either.  And while I haven't
#   tested this module with Cygwin, as a pure shell script solution, I am hopeful
#   that it will work.  Just haven't had a chance to test it yet.
#
# =================================================================================


inject_ruby_path() {
  RUBY_PATH=$1

  # remove old ruby from the path
  RUBYLESS_PATH=$(             \
        echo $PATH             \
      | tr ":" "\n"            \
      | sed "s!.*ruby.*!!i"    \
      | tr "\n" ":"            \
      | sed 's/:*$//'          )

  # add the desired ruby to the path
  export PATH=$RUBY_PATH:$RUBYLESS_PATH

  # remove duplicate colons
  export PATH=$(               \
        echo $PATH             \
      | sed 's/::/:/g'         )
}

find_ruby() {
  RUBY_TYPE=$1
  RUBY_VERSION=$2

  # find the desired version of ruby and trim
  # the trailing forward slash
  echo $(                   \
    ls -d1 /c/*uby*         \
    | grep -i $RUBY_TYPE    \
    | grep -i $RUBY_VERSION \
    | sed 's:/$::'          )
}

active_ruby() {
  echo $(            \
    ruby -v          \
    | sed "s/ (.*$//" \
    | tr " " "-"     )
}

use_ruby() {
  RUBY_TYPE=$1
  RUBY_VERSION=$2
  NEXT_RUBY=$(find_ruby $RUBY_TYPE $RUBY_VERSION)

  inject_ruby_path $NEXT_RUBY/bin

  if [ "$RUBY_TYPE" == "ruby" ]; then
    export JRUBY_HOME=
    export RUBY_HOME=$NEXT_RUBY
    export RUBY_EXEC="ruby.exe"
    export GEM_EXEC=
    export IRB_EXEC=

    alias jgem='deleting...'; unalias jgem
    alias gem='deleting...'; unalias gem
    alias jirb='deleting...'; unalias jirb
    alias irb='deleting...'; unalias irb
  else # It's JRuby
    export RUBY_HOME=
    export JRUBY_HOME=$NEXT_RUBY
    export RUBY_EXEC="jruby.exe"
    export GEM_EXEC="$RUBY_EXEC -S gem"
    export IRB_EXEC="$RUBY_EXEC -S irb"

    # These aliases supplied for MinGW so that
    # it will not inadvertantly execute the
    # shell scripts provided with ruby/jruby
    alias gem='$GEM_EXEC'
    alias jgem='$GEM_EXEC'
    alias irb='$IRB_EXEC'
    alias jirb='$IRB_EXEC'
  fi

  alias ruby='$RUBY_EXEC'
  alias jruby='$RUBY_EXEC'

  # gimme some kinda sign!
  active_ruby
}
