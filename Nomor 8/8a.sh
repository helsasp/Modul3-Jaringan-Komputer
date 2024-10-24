service nginx start

echo '
upstream backend {
    least_conn;
    server 10.92.1.2;
    server 10.92.1.3;
    server 10.92.1.4;
}

server {
    listen 80;
    server_name gryffindor.hogwarts.c05.com;

    location / {
        proxy_pass http://backend;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header Host $http_host;
    }

    error_log /var/log/nginx/lb_error.log;
    access_log /var/log/nginx/lb_access.log;
}
' > /etc/nginx/sites-available/load_balancer

service nginx restart

echo '127.0.0.1 gryffindor.hogwarts.c05.com' >> /etc/hosts