#!/bin/bash

# Start MYSQL

service mariadb start

# Install MYSQL
mysql_secure_installation << _EOF_
n
Y
$MYSQL_ROOT_PASSWORD
$MYSQL_ROOT_PASSWORD
Y
Y
Y
Y
_EOF_

if [ ! -d "/var/lib/mysql${MYSQL_DATABASE}" ]; then
    mysql -u root -p${MYSQL_ROOT_PASSWORD} -e "CREATE DATABASE ${MYSQL_DATABASE};"
    mysql -e "CREATE USER '${MYSQL_USER}'@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';"
    mysql -e "GRANT ALL ON ${MYSQL_DATABASE}.* TO '${MYSQL_USER}'@'%' IDENTIFIED BY '${MYSQL_PASSWORD}' WITH GRANT OPTION;"
    mysql -e "FLUSH PRIVILEGES;"
    echo "Database created"
else
    echo "Database already exists"
fi

service mariadb stopss

exec "$@"