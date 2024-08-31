#!/bin/bash

# Set up WordPress if it's not already installed
if [ -f ./wp-config.php ]; then
    echo "WordPress already installed"
else
    echo "WordPress not installed"
    
    echo "Downloading WordPress..."
    wget https://wordpress.org/latest.tar.gz -O latest.tar.gz
    tar -xzf latest.tar.gz
    rm latest.tar.gz

    echo "Configuring WordPress..."
    sed -i "s/database_name_here/$WORDPRESS_DB_NAME/g" wp-config.php
    sed -i "s/username_here/$WORDPRESS_DB_USER/g" wp-config.php
    sed -i "s/password_here/$WORDPRESS_DB_PASSWORD/g" wp-config.php
    sed -i "s/localhost/$WORDPRESS_DB_HOST/g" wp-config.php
    cp wp-config-sample.php wp-config.php

    echo "WordPress installed"
fi

# Execute CMD from the Dockerfile
exec "$@"
