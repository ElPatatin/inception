# Use the slim version of Debian for a lightweight base image
FROM debian:11-slim

# Install the necessary packages
RUN apt-get update && apt-get install -yy \
    mariadb-server \
    mariadb-client \
    && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /var/lib/mysqld /run/mysqld

# Copy
COPY ./conf/create_db.sql /tmp/create_db.sql

# Copy configuration script
COPY ./tools/entrypoint.sh ./
RUN chmod +x ./entrypoint.sh

# Copy the custom MariaDB configuration file
COPY ./conf/mariadb.cnf /etc/my.cnf.d/
COPY ./conf/mariadb.cnf /etc/mysql/mariadb.cnf

RUN mariadb-install-db --datadir=/var/lib/mysql --auth-root-authentication-method=normal

RUN chown -R mysql:mysql /var/lib/mysql

RUN chown -R mysql:mysql /run/mysqld

# Expose the default MariaDB port
EXPOSE 3306

# Set MariaDB to run in the foreground by default
CMD [ "sh", "entrypoint.sh" ]