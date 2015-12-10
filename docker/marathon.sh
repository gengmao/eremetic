#!/bin/sh

lookup_host() {
    nslookup "$1" | awk -v HOST="$1" '{ if ($2 == HOST) { getline; gsub(/^.*: /, ""); print $1 } }'
}

export MESSENGER_ADDRESS=`lookup_host ${HOST}${DOMAIN:+.$DOMAIN}`
export MESSENGER_PORT=$PORT1


exec /opt/eremetic/eremetic
