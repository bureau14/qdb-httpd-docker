#!/usr/bin/env sh

QDB_HTTPD=`which qdb_httpd`

IP=`which ip`
AWK=`which awk`
PORT=8080

IP=`${IP} route get 8.8.8.8 | ${AWK} 'NR==1 {print $NF}'`

DB_IP=${DB_PORT_2836_TCP_ADDR}
DB_PORT=${DB_PORT_2836_TCP_PORT}

${QDB_HTTPD} --root /usr/share/qdb/console --node ${DB_IP}:${DB_PORT} -a ${IP}:${PORT} $@
