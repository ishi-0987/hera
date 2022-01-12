#!/usr/bin/env bash
FILE="/usr/local/openresty/nginx/sbin/get_ports.py"
if test -f "$FILE"; then
  python3 /usr/local/openresty/nginx/sbin/get_ports.py
else
  sed -i "s/WHAT_TO_LISTEN/listen 10102 ssl;/g" /usr/local/openresty/nginx/conf/nginx.conf;
fi

/usr/local/openresty/nginx/sbin/heartbeat.sh &
redis-server &
python3 /usr/local/local_server/local_server.py &
/usr/local/openresty/nginx/sbin/nginx -g 'daemon off;'
