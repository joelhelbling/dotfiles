
# nationwide proxy server
export USERNAME=`echo $LOGNAME | tr "A-Z" "a-z"`
export PROXY_PWD=MyPassWord
PROXY_PROTOCOL=http
PROXY_SERVER=my.proxy.server.net
PROXY_PORT=8080
export HTTP_PROXY=$PROXY_PROTOCOL://$USERNAME:$PROXY_PWD@$PROXY_SERVER:$PROXY_PORT

# add the lower case variant for git's benefit
export http_proxy=$HTTP_PROXY
