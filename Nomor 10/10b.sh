mkdir -p /etc/nginx/secretchamber 
htpasswd -c /etc/nginx/secretchamber/.htpasswd jarkom


echo '
upstream backend {
    server 10.92.1.2;
    server 10.92.1.3;
}

server {
    listen 80;
    server_name gryffindor.hogwarts.c05.com;

    location / {
        proxy_pass http://backend;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header Host $http_host;
        auth_basic "Restricted Access"; 
        auth_basic_user_file /etc/nginx/secretchamber/.htpasswd;

    }

    error_log /var/log/nginx/lb_error.log;
    access_log /var/log/nginx/lb_access.log;
}
' > /etc/nginx/sites-available/load_balancer

service nginx restart
