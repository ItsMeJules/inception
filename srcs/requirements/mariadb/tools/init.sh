#!/bin/bash

set -xve

FILE=/var/lib/mysql/.db_init

if [ ! -f "$FILE" ]; then
	service mysql start
	echo "CREATE DATABASE IF NOT EXISTS $MYSQL_DATABASE;" | mysql
	echo "CREATE USER IF NOT EXISTS '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';" | mysql
	echo "GRANT ALL ON $MYSQL_DATABASE.* TO '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD' WITH GRANT OPTION;" | mysql
	echo "FLUSH PRIVILEGES;" | mysql
	echo "SET PASSWORD FOR 'root'@'localhost' = PASSWORD('$MYSQL_ROOT_PASSWORD');" | mysql
	service mysql stop
	touch $FILE
fi

exec mysqld -u mysql