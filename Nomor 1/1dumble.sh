
echo 'zone "gryffindor.hogwarts.c05.com" {
        type master;
        file "/etc/bind/hogwarts/gryffindor.hogwarts.c05.com";
};

zone "ravenclaw.hogwarts.c05.com" {
        type master;
        file "/etc/bind/hogwarts/ravenclaw.hogwarts.c05.com";
};' >> /etc/bind/named.conf.local


mkdir -p /etc/bind/hogwarts
cp /etc/bind/db.local /etc/bind/hogwarts/gryffindor.hogwarts.c05.com


echo ';
; BIND data file for local loopback interface
;
$TTL    604800
@       IN      SOA     gryffindor.hogwarts.c05.com. root.gryffindor.hogwarts.c05.com. (
                        2024111301      ; Serial
                        604800          ; Refresh
                        86400           ; Retry
                        2419200         ; Expire
                        604800 )        ; Negative Cache TTL
;
@               IN      NS      gryffindor.hogwarts.c05.com.
@               IN      A       10.92.4.2 ; IP Load Balancer Voldemort' > /etc/bind/hogwarts/gryffindor.hogwarts.c05.com


cp /etc/bind/db.local /etc/bind/hogwarts/ravenclaw.hogwarts.c05.com


echo ';
; BIND data file for local loopback interface
;
$TTL    604800
@       IN      SOA     ravenclaw.hogwarts.c05.com. root.ravenclaw.hogwarts.c05.com. (
                        2024111301      ; Serial
                        604800          ; Refresh
                        86400           ; Retry
                        2419200         ; Expire
                        604800 )        ; Negative Cache TTL
;
@               IN      NS      ravenclaw.hogwarts.c05.com.
@               IN      A       10.92.4.3 ; IP Load Balancer Dementor' > /etc/bind/hogwarts/ravenclaw.hogwarts.c05.com

echo 'options {
        directory "/var/cache/bind";

        forwarders {
                192.168.122.1;
        };

        dnssec-validation auto;
        allow-query { any; };
        auth-nxdomain no;    # conform to RFC1035
        listen-on-v6 { any; };
};' > /etc/bind/named.conf.options

service named restart