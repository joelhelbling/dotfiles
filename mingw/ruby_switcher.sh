
# Switching Rubies

# need ruby to appear somewhere in the path in order 
# for this to work the first time
export PATH=/dummy/ruby/placeholder:$PATH

use_ruby() {
  export RUBY_TYPE=$1
  export RUBY_VERSION=$2
  NEXT_RUBY=$(ls -d1 /c/*uby* | grep -i $RUBY_TYPE | grep -i $RUBY_VERSION | sed 's:/$::' )
  export PATH=$(echo $PATH | tr ":" "\n" | sed "s:.*ruby.*:$NEXT_RUBY/bin:i" | tr "\n" ":")
  if [ "$RUBY_TYPE" == "ruby" ]; then
    export JRUBY_HOME=
    export RUBY_HOME=$NEXT_RUBY
    export RUBY_EXEC="ruby.exe"
    export GEM_EXEC="$RUBY_EXEC -S gem"
  else
    export RUBY_HOME=
    export JRUBY_HOME=$NEXT_RUBY
    export RUBY_EXEC="jruby.exe"
    export GEM_EXEC="$RUBY_EXEC -S jgem"
  fi
  alias gem='$GEM_EXEC'
  alias jgem='$GEM_EXEC'
  $RUBY_EXEC -v
}
