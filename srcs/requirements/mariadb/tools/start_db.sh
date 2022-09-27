SETFILE=/var/lib/mysql/init_db
set -xve

if [ ! -f "$SETFILE" ]; then
	service mysql start
	echo "CREATE DATABASE IF NOT EXISTS ${DB_NAME};" | mysql
	echo "CREATE USER IF NOT EXISTS '${DB_USER}'@'%' IDENTIFIED BY '${DB_PASSWORD}';" | mysql
	echo "GRANT ALL PRIVILEGES ON ${DB_NAME}.* TO '${DB_USER}'@'%';" | mysql
	echo "FLUSH PRIVILEGES;" | mysql
	echo "SET PASSWORD FOR 'root'@'localhost' = PASSWORD('${DB_ROOT_PASSWORD}');" | mysql
	touch $SETFILE
	service mysql stop
fi
mysqld_safe