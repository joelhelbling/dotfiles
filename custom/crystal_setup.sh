if [ -d "/usr/local/opt/llvm" ]; then
  export PATH="/usr/local/opt/llvm/bin:$PATH"
  export PKG_CONFIG_PATH=$PKG_CONFIG_PATH:/usr/local/opt/openssl/lib/pkgconfig
fi
