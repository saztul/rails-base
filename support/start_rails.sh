#!/bin/sh
sh /support/await_mysql.sh

cd /rails && RAILS_ENV=production_setup bundle exec rake db:create
cd /rails && RAILS_ENV=production_setup bundle exec rake db:migrate

exec bundle exec puma -C /support/puma.rb;