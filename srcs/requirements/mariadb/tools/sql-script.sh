mysql_install_db;
service mysql start;   
sleep 0.5

mysql -e "CREATE DATABASE IF NOT EXISTS \`${SQL_DATABASE}\`;" #creates the table
mysql -e "CREATE USER IF NOT EXISTS \`${SQL_USER}\`@'localhost' IDENTIFIED BY '${SQL_PASSWORD}';"
mysql -e "GRANT ALL PRIVILEGES ON \`${SQL_DATABASE}\`.*TO \`${SQL_USER}\`@%' IDENTIFIED BY '${SQL_PASSWORD}';"
sleep 0.5
mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${SQL_ROOT_PASSWORD}';"
sleep 0.5
mysql -e "FLUSH PRIVILEGES;"


mysqladmin -u root -p${SQL_ROOT_PASSWORD} shutdown
exec mysqld_safe