
# nationwide proxy server
export USERNAME=`echo $LOGNAME | tr "A-Z" "a-z"`
export PROXY_PWD=MyPassWord
PROXY_PROTOCOL=http
PROXY_SERVER=http-gateway.nwie.net
PROXY_PORT=80
export HTTP_PROXY=$PROXY_PROTOCOL://$USERNAME:$PROXY_PWD@$PROXY_SERVER:$PROXY_PORT
export http_proxy=$HTTP_PROXY
