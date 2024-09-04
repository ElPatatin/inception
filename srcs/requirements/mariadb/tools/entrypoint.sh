#!/bin/bash

# Start MariaDB
service mariadb start

# Wait for MariaDB to be fully up and running
until mysqladmin ping >/dev/null 2>&1; do
    echo "Waiting for MariaDB to start..."
    sleep 3
done

if [ ! -d "/var/lib/mysql/$MYSQL_DATABASE" ]; then
    echo "Creating database..."
    mysql -u $MYSQL_ROOT_USER -p$MYSQL_ROOT_PASSWORD -e "CREATE DATABASE $MYSQL_DATABASE;"
    mysql -u $MYSQL_ROOT_USER -p$MYSQL_ROOT_PASSWORD -e "CREATE USER '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';"
    mysql -u $MYSQL_ROOT_USER -p$MYSQL_ROOT_PASSWORD -e "GRANT ALL ON $MYSQL_DATABASE.* TO '$MYSQL_USER'@'%'  IDENTIFIED BY '$MYSQL_PASSWORD' WITH GRANT OPTION;"
    mysql -u $MYSQL_ROOT_USER -p$MYSQL_ROOT_PASSWORD -e "FLUSH PRIVILEGES;"
else
    echo "Database already exists."
fi

mysqladmin -u $MYSQL_ROOT_USER --password=$MYSQL_ROOT_PASSWORD shutdown

# Start MariaDB in the foreground
mysqld