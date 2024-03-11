echo "Loading mariadb initialization script..."
/etc/init.d/mariadb start

    echo "setting root password"
    mysql -uroot -e "SET PASSWORD FOR 'root'@'localhost' = PASSWORD('${ROOT_PASSWORD}');"
    sleep 0.5
    mysql -uroot -e "FLUSH PRIVILEGES;"
    sleep 0.5
    echo "create database"
    mysql -uroot -p"${ROOT_PASSWORD}" -e "CREATE DATABASE IF NOT EXISTS \`${DATABASE}\`;" 
    sleep 0.5

    echo "create user"
    mysql -uroot -p"${ROOT_PASSWORD}" -e "CREATE USER IF NOT EXISTS \`${USER}\`@'localhost';"
    sleep 0.5
    mysql -uroot -p"${ROOT_PASSWORD}" -e "SET PASSWORD FOR '${USER}'@'localhost' = PASSWORD('${USER_PASSWORD}');"
    sleep 0.5

    echo "set '${USER}' priviliges"
    mysql -uroot -p"${ROOT_PASSWORD}" -e "GRANT ALL PRIVILEGES ON *.* TO '${USER}'@'wordpress.srcs_inception' IDENTIFIED BY '${USER_PASSWORD}';"
    sleep 0.5
    mysql -u root -p"${ROOT_PASSWORD}" -e "FLUSH PRIVILEGES;";
    sleep 0.5
    touch db_configured


mysqladmin -uroot -p"{ROOT_PASSWORD}" shutdown

exec "$@"