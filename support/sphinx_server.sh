#!/bin/sh
sh /support/await_mysql.sh

cd /rails && RAILS_ENV=production bundle exec rake ts:configure

/usr/bin/indexer -c /rails/config/production.sphinx.conf --all
/usr/bin/searchd -c /rails/config/production.sphinx.conf