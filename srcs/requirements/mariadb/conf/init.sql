/*    By: cpeset-c
 *    Created: 31-09-2024 12:00
 *    Modified: 31-09-2024 12:00
 *    Version: 1
 *    Description: This file is used to create the database and the user for the wordpress website.
 */

-- Delete the default database and user
DELETE FROM mysql.user WHERE user = '';
DROP DATABASE IF EXISTS test;
DELETE FROM mysql.db WHERE db = 'test' OR db = 'test\\_%';
DELETE FROM mysql.user WHERE user = 'root' AND host NOT IN ('localhost', '127.0.0.1', '::1');

-- Create the database and the user
SET PASSWORD FOR 'root'@'localhost' = PASSWORD('${MYSQL_ROOT_PASSWORD}');
CREATE DATABASE IF NOT EXISTS ${MYSQL_DATABASE} CHARACTER SET utf8 COLLATE utf8_general_ci;
GRANT ALL PRIVILEGES ON ${MYSQL_DATABASE}.* TO '${MYSQL_USER}'@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';

-- Flush the privileges
FLUSH PRIVILEGES;