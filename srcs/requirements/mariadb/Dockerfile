# Use the slim version of Debian for a lightweight base image
FROM debian:11-slim

# Install the necessary packages
RUN apt-get update && apt-get install -yy \
    mariadb-server \
    mariadb-client \
    && rm -rf /var/lib/apt/lists/*

# Create the directory for the MariaDB socket
RUN mkdir -p /var/run/mysqld \
    && chown -R mysql:mysql /var/run/mysqld \
    && chmod 777 /var/run/mysqld

# Expose the default MariaDB port
EXPOSE 3306

# Copy the custom MariaDB configuration file
COPY ./conf/mariadb.cnf /etc/mysql/mariadb.conf.d/50-server.cnf
RUN chown -R mysql:mysql /etc/mysql/mariadb.conf.d/50-server.cnf

# Copy the custom MariaDB entrypoint script
COPY ./tools/entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod 777 /usr/local/bin/entrypoint.sh

# Copy the custom MariaDB initialization script
COPY ./tools/init.sql /usr/local/bin/init.sql
RUN chmod 777 /usr/local/bin/init.sql

# Set the entrypoint script to run by default
ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]

# Set the MariaDB server to run in the foreground by default
CMD ["mysqld", "--bind-address=0.0.0.0"]