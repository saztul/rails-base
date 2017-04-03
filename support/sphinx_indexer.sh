#!/bin/sh
sh /support/await_mysql.sh

while true; do
    echo '[Sphinx indexer] Waiting 30s..'
    sleep 300
    /usr/bin/indexer \
      -c /rails/config/production.sphinx.conf \
      --all \
      --rotate
done
