service nginx start

echo '
upstream backend {
    server 10.92.1.2;
    server 10.92.1.3;
    server 10.92.1.4;  
}

server {
    listen 80;
    server_name gryffindor.hogwarts.c05.com;

    location / {
        proxy_pass http://backend;

        # Tambahkan autentikasi jika diperlukan
        auth_basic "Restricted Access";
        auth_basic_user_file /etc/nginx/secretchamber/.htpasswd;
    }

    location /informatika {
        proxy_pass https://www.its.ac.id/informatika/id/beranda/;
        proxy_set_header Host www.its.ac.id;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $scheme;
    }

    error_log /var/log/nginx/lb_error.log;
    access_log /var/log/nginx/lb_access.log;
}
' > /etc/nginx/sites-available/load_balancer

service nginx restart
