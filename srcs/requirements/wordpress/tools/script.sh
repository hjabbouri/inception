#!/bin/sh

wp core download --allow-root

wp core config --allow-root \
				--dbhost=$DB_HOST \
				--dbname=$DB_NAME \
				--dbuser=$DB_USER \
				--dbpass=$DB_USER_PASSWORD \
				--skip-check

				# --url=localhost \
wp core install --allow-root \
				--url=$DOMAIN \
				--title=$TITLE \
				--admin_user=$ADMIN_USERNAME \
				--admin_password=$ADMIN_PASSWORD \
				--admin_email=$ADMIN_EMAIL

wp user create --allow-root \
				$LOGIN \
				$USER_MAIL \
				--role=author

				# $USER_PASSWORD

/usr/sbin/php-fpm7.4 -F
