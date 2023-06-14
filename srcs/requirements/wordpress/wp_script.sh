#!/bin/bash

while ! mariadb -h$DB_HOST -u$DB_ADMIN -p$DB_ADMIN_PASSWORD; do 
    echo "Waiting to connect to DATABASE"
    sllep 2
done

# if [ ! -f wp-config.php ]; then
#     wp core download --allow-root
#     wp config create --dbname="$DB_NAME" --dbuser="$DB_ADMIN" \
#         --dbpass="$DB_ADMIN_PASSWORD" --dbhost="$DB_HOST" --allow-root