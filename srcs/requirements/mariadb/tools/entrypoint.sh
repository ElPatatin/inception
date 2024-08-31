#!/bin/bash

# Install MYSQL
mysql_install_db --user=mysql --datadir=/var/lib/mysql

# Start MYSQL
mysqld --user=mysql --init-file=/init.sql &
# /etc/init.d/mysql start

# Create database
if [ ! -d "/var/lib/mysql${MYSQL_DATABASE}" ]; then
    mysql_secure_installation <<EOF
Y
${MYSQL_ROOT_PASSWORD}
${MYSQL_ROOT_PASSWORD}
Y
n
Y
Y
EOF

    mysql -u root -e "CREATE DATABASE ${MYSQL_DATABASE};"
    mysql -u root -e "CREATE USER '${MYSQL_USER}'@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';"

    if [ "${MYSQL_DATABASE}" != "" ]; then
        mysql -u root -e "GRANT ALL PRIVILEGES ON ${MYSQL_DATABASE}.* TO '${MYSQL_USER}'@'%';"
    fi

    mysql -u root -e "FLUSH PRIVILEGES;"

    if [ -f "/init.sql" ]; then
        mysql -u root -p${MYSQL_ROOT_PASSWORD} ${MYSQL_DATABASE} < /init.sql
    fi

    echo "Database created"
else
    echo "Database already exists"
fi

# Stop MYSQL
# killall mysqld
# sleep 10
/etc/init.d/mysql stop

exec "$@"