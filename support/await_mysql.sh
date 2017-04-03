#!/bin/sh
until mysql -uroot -p$MYSQL_ROOT_PASSWORD -h $MYSQL_HOST --database $MYSQL_DATABASE -e 'show tables;' > /dev/null 2>&1
do
  echo "Waiting for MySQL Server..."
  sleep 1
done
echo "MySQL Server online."
sleep 1
