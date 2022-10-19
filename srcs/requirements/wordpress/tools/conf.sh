#!/bin/bash

set -xve

if [ -f "/var/www/wordpress/wp-config.php" ]; then
	rm /var/www/wordpress/wp-config.php
fi
wp config create --dbname=$DB_NAME --dbuser=$DB_USER --dbpass=$DB_PASSWORD --dbhost=$DB_HOST --path="$WP_PATH" --allow-root --skip-check
wp core install --url="$DOMAIN_NAME" --title="$TITLE" --admin_user="$DB_ROOT_USER" --admin_password="$DB_ROOT_PASSWORD" --admin_email="$DB_ROOT_EMAIL" --path="$WP_PATH" --allow-root

php-fpm7.3 -F -R