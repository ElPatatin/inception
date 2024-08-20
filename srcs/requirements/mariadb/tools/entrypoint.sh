cat .setup 2> /dev/null
if [ $? -ne 0 ]; then
	# https://dev.mysql.com/doc/refman/8.0/en/mysqld-safe.html
	usr/bin/mysqld_safe --datadir=/var/lib/mysql &

	while ! mysqladmin ping -h "$MYSQL_HOST" --silent; do
    	sleep 1
	done

	eval "echo \"$(cat /tmp/create_db.sql)\"" | mariadb
	touch .setup
fi
usr/bin/mysqld_safe --datadir=/var/lib/mysql