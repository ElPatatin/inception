#!/bin/bash

# Start MariaDB
service mariadb start

# Wait for MariaDB to be fully up and running
if [ ! -d "/var/lib/mysql/$DB_NAME" ]; then
    echo "Creating database..."
    mysql -u $MYSQL_ROOT_USER -p$MYSQL_ROOT_PASSWORD -e "CREATE DATABASE $DB_NAME;"
    mysql -u $MYSQL_ROOT_USER -p$MYSQL_ROOT_PASSWORD -e "CREATE USER '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';"
    mysql -u $MYSQL_ROOT_USER -p$MYSQL_ROOT_PASSWORD -e "GRANT ALL ON $DB_NAME.* TO '$MYSQL_USER'@'%'  IDENTIFIED BY '$MYSQL_PASSWORD' WITH GRANT OPTION;"
    mysql -u $MYSQL_ROOT_USER -p$MYSQL_ROOT_PASSWORD -e "FLUSH PRIVILEGES;"
else
    echo "Database already exists."
fi

mysqladmin -u $MYSQL_ROOT_USER --password=$MYSQL_ROOT_PASSWORD shutdown

# Start MariaDB in the foreground
mysqld