
service mysql start


mysql -u root -p <<EOF
CREATE USER 'kelompokc05'@'10.92.6.4' IDENTIFIED BY 'passwordc05';
CREATE USER 'kelompokc05'@'10.92.6.3' IDENTIFIED BY 'passwordc05';
CREATE USER 'kelompokc05'@'10.92.6.2' IDENTIFIED BY 'passwordc05';
CREATE DATABASE dbkelompokc05;
GRANT ALL PRIVILEGES ON dbkelompokc05.* TO 'kelompokc05'@'10.92.6.4';
GRANT ALL PRIVILEGES ON dbkelompokc05.* TO 'kelompokc05'@'10.92.6.3';
GRANT ALL PRIVILEGES ON dbkelompokc05.* TO 'kelompokc05'@'10.92.6.2';
FLUSH PRIVILEGES;
EOF


sed -i '/\[mysqld\]/a skip-networking=0\nskip-bind-address' /etc/mysql/my.cnf


service mysql restart

