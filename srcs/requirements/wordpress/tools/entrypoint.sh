#!/bin/bash

# Set up WordPress if it's not already installed
if [ ! -f wp-config.php ]; then
    wp core download --allow-root
    wp config create --dbname=$DB_NAME --dbuser=$MYSQL_USER --dbpass=$MYSQL_PASSWORD --dbhost=$DB_HOST --allow-root
    wp core install --url=$DOMAIN_NAME --title="$WORDPRESS_TITL"E --admin_user=$WORDPRESS_ADMIN_USER --admin_password=$WORDPRESS_ADMIN_PASSWORD --admin_email=$WORDPRESS_ADMIN_EMAIL --skip-email --allow-root
    wp user create $WORDPRESS_USER $WORDPRESS_USER_EMAIL --role=author --user_pass=$WORDPRESS_USER_PASSWORD --allow-root
    # wp theme install twentynineteen --activate --allow-root
    echo "WordPress installed"
fi

# Execute CMD from the Dockerfile
/usr/sbin/php-fpm7.4 -F;