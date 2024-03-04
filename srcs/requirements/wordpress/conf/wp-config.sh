echo "running script.."
sleep 10

if [ -f /var/www/html/wp-config.php ]; then
    echo "wordpress is already configured."
    /usr/sbin/php-fpm7.4 -F

else


wp config create --allow-root \
    --dbname=${DATABASE} \
    --dbuser=${USER} \
    --dbpass=${USER_PASSWORD} \
    --dbhost=mariadb 

wp core install --allow-root \
        --url=${HOSTNAME} \
        --title="Inception" --admin_user=${wp_admin_user} \
        --admin_password=${ROOT_PASSWORD} \
        --admin_email=adm@derblang.42.fr

wp user create --allow-root \
        ${USER} ${USER}@${HOSTNAME} --role=author --user_pass=${USER_PASSWORD}

wp plugin update --allow-root --all

fi

echo "configuration done"

/usr/sbin/php-fpm7.4 -F