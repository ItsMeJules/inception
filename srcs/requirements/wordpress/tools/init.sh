#!/bin/bash

rm -rf /var/www/wordpress/wp-config-sample.php /var/www/wordpress/wp-config.php
wp config create --dbname=$MYSQL_DATABASE --dbuser=$MYSQL_USER -dbpass=$MYSQL_PASSWORD --dbhost=$DB_HOST --path="/var/www/wordpress" --allow-root --skip-check
wp user create $USER $USER@student.42.fr --role='author'

/usr/sbin/php-fpm7.3 -F