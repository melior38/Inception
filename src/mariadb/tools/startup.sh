#!/bin/sh
WP_DATABASE_NAME="Wordpress"
MYSQL_USER="root"
MYSQL_PASS="pass"
MYSQL_ROOT_PASS="password"


cat << EOF > /tmp/db_config.sql
CREATE DATABASE IF NOT EXISTS $WP_DATABASE_NAME;
CREATE USER IF NOT EXISTS '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASS';
GRANT ALL PRIVILEGES ON $WP_DATABASE_NAME.* TO '$MYSQL_USER'@'%';
ALTER USER 'root'@'localhost' IDENTIFIED BY '$MYSQL_ROOT_PASS';
FLUSH PRIVILEGES;
EOF

mysql -h localhost < /tmp/db_config.sql