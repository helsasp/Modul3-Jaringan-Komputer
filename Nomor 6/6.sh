
wget --no-check-certificate 'https://docs.google.com/uc?export=download&id=17R4Zcxm3emHq21WdMJzSfCxO8FHqvATM' -O '/var/www/gryffindor.hogwarts.c05.com.zip'


unzip -o /var/www/gryffindor.hogwarts.c05.com.zip -d /var/www/


mv /var/www/php /var/www/gryffindor.hogwarts.c05.com
mv /var/www/index.php /var/www/gryffindor.hogwarts.c05.com


chown -R www-data:www-data /var/www/gryffindor.hogwarts.c05.com
chmod -R 755 /var/www/gryffindor.hogwarts.c05.com


cp /etc/nginx/sites-available/default /etc/nginx/sites-available/gryffindor.hogwarts.c05.com
ln -s /etc/nginx/sites-available/gryffindor.hogwarts.c05.com /etc/nginx/sites-enabled/
rm /etc/nginx/sites-enabled/default


echo 'server {
	listen 80;
	server_name gryffindor.hogwarts.c05.com;

	root /var/www/gryffindor.hogwarts.c05.com;
	index index.php index.html index.htm;

	location / {
    	try_files $uri $uri/ /index.php?$query_string;
	}

	location ~ \.php$ {
    	include snippets/fastcgi-php.conf;
    	fastcgi_pass unix:/run/php/php7.4-fpm.sock;  # Sesuaikan versi PHP dan socket
    	fastcgi_param SCRIPT_FILENAME $document_root$fastcgi_script_name;
    	include fastcgi_params;
	}
}' > /etc/nginx/sites-available/gryffindor.hogwarts.c05.com


service php7.4-fpm start
service nginx restart

echo '127.0.0.1 gryffindor.hogwarts.c05.com' >> /etc/hosts

lynx gryffindor.hogwarts.c05.com