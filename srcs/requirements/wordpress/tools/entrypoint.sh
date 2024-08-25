#!/bin/bash

if [ -f ./wp-config.php ]; then
    echo "WordPress already installed"
else
    echo "WordPress not installed"

    echo "Installing WordPress..."
    wget https://wordpress.org/latest.tar.gz
    tar -xvf latest.tar.gz
    rm latest.tar.gz
    mv wordpress/* ./
    rm -rf wordpress

    echo "Configuring WordPress..."
    sed -i "s/database_name_here/$WORDPRESS_DB_NAME/g" wp-config-sample.php
    sed -i "s/username_here/$WORDPRESS_DB_USER/g" wp-config-sample.php
    sed -i "s/password_here/$WORDPRESS_DB_PASSWORD/g" wp-config-sample.php
    sed -i "s/localhost/$WORDPRESS_DB_HOST/g" wp-config-sample.php
    cp wp-config-sample.php wp-config.php

    echo "WordPress installed"
fi

# This will execute the CMD from the Dockerfile
exec "$@"

# Exit immediately if a command exits with a non-zero status
set -e