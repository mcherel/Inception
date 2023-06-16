#!/bin/bash

# while ! mariadb -h$DB_HOST -u$DB_ADMIN -p$DB_ADMIN_PASSWORD; do 
#     echo "Waiting to connect to DATABASE"
#     sleep 2
# done

# while ! mysql -h"$DB_HOST" -u"$DB_ADMIN" -p"$DB_ADMIN_PASSWORD" -e "quit" >/dev/null 2>&1; do
#     echo "Waiting to connect to DATABASE"
#     sleep 2
# done

# while ! echo -e "QUIT\n" | telnet mariadb 3306 >/dev/null 2>&1; do
#     echo "Waiting to connect to DATABASE"
#     sleep 1
# done

#!/bin/bash

while ! mysql -h"$DB_HOST" -u"$DB_ADMIN" -p"$DB_ADMIN_PASSWORD" -e "quit" >/dev/null 2>&1; do
    echo "Waiting to connect to DATABASE"
    sleep 2
done


if [ ! -f wp-config.php ]; then
    wp core download    --allow-root
    wp config create    --dbname="$DB_NAME" \
                        --dbuser="$DB_ADMIN" \
                        --dbpass="$DB_ADMIN_PASSWORD" \
                        --dbhost="$DB_HOST" \
                        --allow-root
    
    wp core install     --url="$DOMAIN_NAME" \
                        --title="mcherel42inception" \
                        --admin_user=$WP_ADMIN \
                        --admin_email=$WP_ADMIN_MAIL \
                        --admin_password=$WP_ADMIN_PASSWORD \
                        --skip-email \
                        --allow-root
    
    wp user create  --user=$WP_USER \
                    --user_email=$WP_USER_MAIL \
                    --user_pass=$WP_USER_PASSWORD \
                    --role=author
    echo "Wordpress is configured"
# else
#     echo "Wordpress is already configured"
fi
#Lounch WP
#php-fmp7.3 -F