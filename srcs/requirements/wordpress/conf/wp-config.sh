sleep 10
echo "debug"
#if [ ! -e /var/www/wordpress/wp-config.php ]; then
wp config create --allow-root --dbname=${DATABASE} --dbuser=${USER} --dbpass=${USER_PASSWORD} --dbhost=mariadb:3306 --path='/var/www/wordpress' 
sleep 1
wp core install --allow-root --url=${HOSTNAME} --title="Inception" --admin_user=${ROOT_USER} --path='/var/www/wordpress' --admin_password=${ROOT_PASSWORD} --admin_email=adm@derblang.42.fr
wp user create --allow-root ${USER} ${USER}@${HOSTNAME} --role=author --user_email=${USER}@${HOSTNAME} --user_pass=${USER_PASSWORD} --path='/var/www/wordpress' >> /log.txt
wp plugin update --allow-root --all

#fi
/usr/sbin/php-fpm7.4 -F
