[![Review Assignment Due Date](https://classroom.github.com/assets/deadline-readme-button-22041afd0340ce965d47ae6ef1cefeee28c7c493a6346c4f15d667ab976d596c.svg)](https://classroom.github.com/a/1zoHyFGp)
| Name           | NRP        | Kelas     |
| ---            | ---        | ----------|
| Helsa Sriprameswari Putri| 5025221154 | Jaringan Komputer (C) |
| Jamaluddin | 5025221157 | Jaringan Komputer (C) |

## Put your topology config image here!

![image](https://github.com/user-attachments/assets/3f6eda81-f269-4872-a8a6-7daec154eb4e)


<br>

> Template testing report: https://docs.google.com/document/d/17T0fsnh_4zZTrG-lELDJ88intrc9mkwCzZ_s-23JLCc/edit?usp=sharing

## Put your testing report here! 
> The report is sent in PDF format, uploaded to Drive, and set to public view.

`put the link here`

## Soal 0

> Pada perlombaan akhir tahun kali ini, semua worker dan client ikut serta di dalamnya sebagai perwakilan dari masing-masing asrama. Persiapan yang dilakukan untuk perlombaan ini adalah dengan setup semua network configuration yang sesuai dengan tabel peran diatas. Khusus untuk client menggunakan konfigurasi dari DHCP Server.

> _For the end-of-year competition, all the workers and clients participate, representing their respective houses. The preparation includes setting up the network configuration as per the table above, with clients using DHCP Server configuration_

**Answer**

- Dumbledore:

```
auto eth0
iface eth0 inet dhcp
auto eth1
iface eth1 inet static
  address 10.92.1.1
  netmask 255.255.255.0

auto eth2
iface eth2 inet static
  address 10.92.2.1
  netmask 255.255.255.0

auto eth3
iface eth3 inet static
  address 10.92.3.1
  netmask 255.255.255.0

auto eth4
iface eth4 inet static
  address 10.92.4.1
  netmask 255.255.255.0


auto eth5
iface eth5 inet static
  address 10.92.5.1
  netmask 255.255.255.0


auto eth6
iface eth6 inet static
  address 10.92.6.1
  netmask 255.255.255.0

```

- SeverusSnape:

```
auto eth0
iface eth0 inet static
  address 10.92.3.2
  netmask 255.255.255.0
  gateway 10.92.3.1
```


- McGonagall:

```
auto eth0
iface eth0 inet static
  address 10.92.3.3
  netmask 255.255.255.0
  gateway 10.92.3.1

```

- Hagrid:

```
auto eth0
iface eth0 inet static
  address 10.92.4.2
  netmask 255.255.255.0
  gateway 10.92.4.1


```
- Voldemort:
```
auto eth0
iface eth0 inet static
  address 10.92.4.3
  netmask 255.255.255.0
  gateway 10.92.4.1

```
- Dementor:
```
auto eth0
iface eth0 inet static
  address 10.92.4.4
  netmask 255.255.255.0
  gateway 10.92.4.1

```
- HarryPotter:

```
auto eth0
iface eth0 inet static
  address 10.92.1.2
  netmask 255.255.255.0
  gateway 10.92.1.1


```

- RonWeasley:

```
auto eth0
iface eth0 inet static
  address 10.92.1.3
  netmask 255.255.255.0
  gateway 10.92.1.1


```
- HermioneGranger:
```
auto eth0
iface eth0 inet static
  address 10.92.1.4
  netmask 255.255.255.0
  gateway 10.92.1.1


```

- LunaLovegood:

```
auto eth0
iface eth0 inet static
  address 10.92.6.4
  netmask 255.255.255.0
  gateway 10.92.6.1


```

- FiliusFlitwick:

```
auto eth0
iface eth0 inet static
  address 10.92.6.3
  netmask 255.255.255.0
  gateway 10.92.6.1


```
- ChoChang:
```
auto eth0
iface eth0 inet static
  address 10.92.6.2
  netmask 255.255.255.0
  gateway 10.92.6.1


```

- DracoMalfoy:
```
auto eth0
iface eth0 inet dhcp

```

- AstoriaGreengrass:
```
auto eth0
iface eth0 inet dhcp

```

- SusanBones:
```
auto eth0
iface eth0 inet dhcp

```

- HannahAbbott:

 ```
auto eth0
iface eth0 inet dhcp

```

## Soal 1

> Melakukan registrasi subdomain untuk PHP worker bernama gryffindor.hogwarts.yyy.com yang mengarah ke alamat IP load balancer Voldemort dan untuk laravel worker bernama ravenclaw.hogwarts.yyy.com yang mengarah ke alamat IP load balancer Dementor. Seluruh domain ini berkumpul dalam suatu ruang atau folder bernama hogwarts

> _Registering subdomains for the PHP workers named gryffindor.hogwarts.yyy.com, pointing to the IP Voldemort load balancer, and for the Laravel workers named ravenclaw.hogwarts.yyy.com, pointing to the IP Dementor load balancer. All domains are gathered in a folder named "hogwarts."_

**Answer:**

- Screenshot

  ![image](https://github.com/user-attachments/assets/694183b1-a115-47fe-879d-0ccc5262c6a7)

- Configuration

Mcgonagall DNS Server
```
echo nameserver 192.168.122.1 > /etc/resolv.conf
apt-get update
apt-get install bind9 -y

nano /etc/bind/named.conf.local

zone "gryffindor.hogwarts.c05.com" {
        type master;
        file "/etc/bind/hogwarts/gryffindor.hogwarts.c05.com";
};

zone "ravenclaw.hogwarts.c05.com" {
        type master;
        file "/etc/bind/hogwarts/ravenclaw.hogwarts.c05.com";
};

mkdir /etc/bind/hogwarts
cp /etc/bind/db.local /etc/bind/hogwarts/gryffindor.hogwarts.c05.com
nano /etc/bind/hogwarts/gryffindor.hogwarts.c05.com

;
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
@               IN      A       10.92.4.2 ; IP Load Balancer Voldemort


cp /etc/bind/db.local /etc/bind/hogwarts/ravenclaw.hogwarts.c05.com
nano /etc/bind/hogwarts/ravenclaw.hogwarts.c05.com

;
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
@               IN      A       10.92.4.3 ; IP Load Balancer Dementor


nano /etc/bind/named.conf.options

options {
        directory "/var/cache/bind";

        forwarders {
                192.168.122.1;
        };

        dnssec-validation auto;
        allow-query{any;};
        auth-nxdomain no;    # conform to RFC1035
        listen-on-v6 { any; };
};


service named restart
```
Testing Draco Malfoy :

```
edit config jadi statis

auto eth0
iface eth0 inet static
	address 10.92.2.2
	netmask 255.255.255.0
	gateway 10.92.2.1

echo nameserver 192.168.122.1 > /etc/resolv.conf
apt-get update
apt-get install dnsutils

echo nameserver 10.92.3.3 > /etc/resolv.conf

host -t A gryffindor.hogwarts.c05.com
host -t A ravenclaw.hogwarts.c05.com


```

- Explanation <br>
Konfigurasi ini bertujuan untuk mendaftarkan subdomain untuk dua pekerja: gryffindor.hogwarts.yyy.com yang mengarah ke alamat IP load balancer Voldemort (10.92.4.2) dan ravenclaw.hogwarts.yyy.com yang mengarah ke alamat IP load balancer Dementor (10.92.4.3). Seluruh pengaturan domain dikelompokkan dalam folder bernama "hogwarts" di server DNS BIND. Dalam konfigurasi ini, setiap subdomain memiliki file data DNS yang mendefinisikan informasi seperti tipe zone, alamat IP, dan informasi terkait lainnya, serta pengaturan untuk server DNS yang memastikan permintaan dapat diproses dengan benar. Pengaturan ini memastikan bahwa trafik ke subdomain akan diarahkan ke load balancer yang sesuai, memungkinkan akses ke pekerja PHP dan Laravel yang ditunjuk.

<br>

## Soal 2

> Memberikan ketentuan khusus untuk DracoMalfoy dan AstoriaGreengrass yang mendapat range IP dari [Prefix IP].2.64 - [Prefix IP].2.65 dan [Prefix IP].2.100 - [Prefix IP].2.101

> Selain itu, untuk HannahAbbott dan SusanBones mendapat range IP dari [Prefix IP].5.50 - [Prefix IP].5.51 dan [Prefix IP].5.155 - [Prefix IP].5.156.


> _Special provisions are given to DracoMalfoy and AstoriaGreengrass, who are assigned the IP range from [Prefix IP].2.64 - [Prefix IP].2.65 and [Prefix IP].2.100 - [Prefix IP].2.101._

> _Additionally, HannahAbbott and SusanBones are assigned the IP range from [Prefix IP].5.50 - [Prefix IP].5.51 and [Prefix IP].5.155 - [Prefix IP].5.156._

**Answer:**

- Screenshot

  ![image](https://github.com/user-attachments/assets/5d7bfcc2-f0f2-4223-a9df-860a1e2e9212)
  ![image](https://github.com/user-attachments/assets/739df414-ba71-4f12-9c93-7c6288244074)
  ![image](https://github.com/user-attachments/assets/3fce2ca3-742a-4bb4-83f4-7a4722df2d47)
  ![image](https://github.com/user-attachments/assets/79105791-25b4-47da-a576-3f623c671b19)


- Configuration

SeverusSnape DHCP Server

```
echo nameserver 192.168.122.1 > /etc/resolv.conf
apt-get update
apt-get install isc-dhcp-server
dhcpd --version

nano /etc/default/isc-dhcp-server
INTERFACESv4=”eth0”
nano /etc/dhcp/dhcpd.conf


subnet 10.92.5.0 netmask 255.255.255.0 {
range 10.92.5.50 10.92.5.51;
range 10.92.5.155 10.92.5.156;
 option broadcast-address 10.92.5.255;
    option domain-name-servers 10.92.3.3;
option routers 10.92.5.1;
}

subnet 10.92.4.0 netmask 255.255.255.0 {
}

subnet 10.92.3.0 netmask 255.255.255.0 {
}


subnet 10.92.2.0 netmask 255.255.255.0 {
range 10.92.2.64 10.92.2.65;
range 10.92.2.100 10.92.2.101;
option broadcast-address 10.92.2.255;
option domain-name-servers 10.92.3.3;
option routers 10.92.2.1;
}


service isc-dhcp-server restart
service isc-dhcp-server status

```

- Explanation <br>

Konfigurasi di atas merupakan pengaturan untuk server DHCP yang mengalokasikan rentang alamat IP khusus untuk pengguna tertentu di jaringan. Draco Malfoy dan Astoria Greengrass diberikan rentang IP dari 10.92.2.64 hingga 10.92.2.65 dan 10.92.2.100 hingga 10.92.2.101, yang didefinisikan dalam subnet 10.92.2.0 dengan netmask 255.255.255.0. Sementara itu, Hannah Abbott dan Susan Bones dialokasikan rentang IP dari 10.92.5.50 hingga 10.92.5.51 dan 10.92.5.155 hingga 10.92.5.156 dalam subnet 10.92.5.0. Selain itu, pengaturan tersebut mencakup informasi lain seperti alamat broadcast, server DNS, dan router default untuk setiap subnet. Setelah konfigurasi selesai, server DHCP di-restart untuk menerapkan perubahan. Ini memastikan bahwa perangkat dalam jaringan dapat memperoleh alamat IP sesuai dengan ketentuan yang telah ditetapkan.

<br>

## Soal 3

> Khusus untuk HermioneGranger yang berada di switch 1 mendapat range IP dari
[Prefix IP].1.10 - [Prefix IP].1.15 dan [Prefix IP].1.20 - [Prefix IP].1.25

> Khusus untuk ChoChang yang berada di switch 6 mendapat range IP dari 
[Prefix IP].6.10 - [Prefix IP].6.15 dan [Prefix IP].6.20 - [Prefix IP].6.25


> _HermioneGranger, who is on switch 1, is assigned the IP range from [Prefix IP].1.10 - [Prefix IP].1.15 and [Prefix IP].1.20 - [Prefix IP].1.25._

> _ChoChang, who is on switch 6, is assigned the IP range from [Prefix IP].6.10 - [Prefix IP].6.15 and [Prefix IP].6.20 - [Prefix IP].6.25._

**Answer:**

- Screenshot
![image](https://github.com/user-attachments/assets/efab4077-7590-4e6f-9448-58a925ed779a)
![image](https://github.com/user-attachments/assets/b5059cf1-5b36-4608-a79c-6055024cfc40)


- Configuration
```
nano /etc/dhcp/dhcpd.conf
  
subnet 10.92.6.0 netmask 255.255.255.0 {
	range 10.92.6.10 10.92.6.15;
	range 10.92.6.20 10.92.6.25;
	option broadcast-address 10.92.6.255;
	option domain-name-servers 10.92.3.3;
	option routers 10.92.6.1;

}

subnet 10.92.1.0 netmask 255.255.255.0 {
	range 10.92.1.10 10.92.1.15;
	range 10.92.1.20 10.92.1.25;
	option broadcast-address 10.92.1.255;
	option domain-name-servers 10.92.3.3;
	option routers 10.92.1.1;

}

service isc-dhcp-server restart
service isc-dhcp-server status
```

- Explanation

Konfigurasi DHCP yang diberikan mengatur dua subnet berbeda untuk mengalokasikan rentang alamat IP kepada dua pengguna yang terhubung ke switch yang berbeda. Untuk HermioneGranger yang terhubung ke switch 1, subnet 10.92.1.0 dengan netmask 255.255.255.0 mengalokasikan IP dari 10.92.1.10 hingga 10.92.1.15 dan 10.92.1.20 hingga 10.92.1.25. Sedangkan untuk ChoChang yang terhubung ke switch 6, subnet 10.92.6.0 juga dengan netmask yang sama, mengalokasikan IP dari 10.92.6.10 hingga 10.92.6.15 dan 10.92.6.20 hingga 10.92.6.25. Setiap subnet juga memiliki opsi broadcast address, DNS server, dan router yang ditentukan, serta waktu sewa default dan maksimal untuk alamat IP yang diberikan. Setelah konfigurasi, layanan DHCP di-restart untuk menerapkan perubahan.
<br>

## Soal 4

> Menetapkan batasan waktu untuk DHCP server dalam peminjaman alamat IP untuk client melalui switch 2 selama 5 menit sedangkan client yang melalui switch 5 selama 20 menit. Untuk switch 1 dan switch 6 memiliki batas waktu 10 menit. Alokasi waktu maksimal peminjaman alamat IP selama 100 menit. 

> _The DHCP server's lease time for IP addresses is set as follows: Clients connected through switch 2 have a lease time of 5 minutes, Clients connected through switch 5 have a lease time of 20 minutes, Switches 1 and 6 have a lease time of 10 minutes, The maximum lease time for IP addresses is set at 100 minutes._

**Answer:**

- Screenshot

  `Put your screenshot in here`

- Configuration
```
nano /etc/dhcp/dhcpd.conf

	subnet 10.92.6.0 netmask 255.255.255.0 {
	range 10.92.6.10 10.92.6.15;
	range 10.92.6.20 10.92.6.25;
	option broadcast-address 10.92.6.255;
	option domain-name-servers 10.92.3.3;
	option routers 10.92.6.1;
	default-lease-time 600;
	max-lease-time 6000;
}

subnet 10.92.5.0 netmask 255.255.255.0 {
	range 10.92.5.50 10.92.5.51;
	range 10.92.5.155 10.92.5.156;
	option broadcast-address 10.92.5.255;
	option domain-name-servers 10.92.3.3;
	option routers 10.92.5.1;
	default-lease-time 1200;
	max-lease-time 6000;
}

subnet 10.92.4.0 netmask 255.255.255.0 {
}

subnet 10.92.3.0 netmask 255.255.255.0 {
}

subnet 10.92.2.0 netmask 255.255.255.0 {
	range 10.92.2.64 10.92.2.65;
	range 10.92.2.100 10.92.2.101;
	option broadcast-address 10.92.2.255;
	option domain-name-servers 10.92.3.3;
	option routers 10.92.2.1;
	default-lease-time 300;
	max-lease-time 6000;
}

subnet 10.92.1.0 netmask 255.255.255.0 {
	range 10.92.1.10 10.92.1.15;
	range 10.92.1.20 10.92.1.25;
	option broadcast-address 10.92.1.255;
	option domain-name-servers 10.92.3.3;
	option routers 10.92.1.1;
	default-lease-time 600;
	max-lease-time 6000;
}

service isc-dhcp-server restart
```

- Explanation <br>

Konfigurasi DHCP server di atas menetapkan waktu peminjaman alamat IP (lease time) untuk klien berdasarkan switch yang digunakan. Untuk klien yang terhubung melalui switch 2, waktu peminjaman ditetapkan selama 5 menit (300 detik), sedangkan klien melalui switch 5 mendapatkan waktu 20 menit (1200 detik). Untuk switch 1 dan switch 6, waktu peminjaman ditetapkan pada 10 menit (600 detik). Konfigurasi juga menentukan bahwa waktu maksimum untuk peminjaman alamat IP adalah 100 menit (6000 detik). Setiap subnet juga memiliki pengaturan alamat IP yang bisa dipinjam (range), alamat broadcast, server DNS, dan router default yang sesuai dengan subnet masing-masing. Setelah konfigurasi selesai, layanan DHCP server perlu direstart untuk menerapkan perubahan.

<br>

## Soal 5

> Memastikan bahwa semua CLIENT, HermioneGranger, dan ChoChang harus menggunakan konfigurasi dari DHCP server, menerima DNS dari Professor McGonagall dan dapat akses internet. Khusus untuk HermioneGranger dan ChoChang mendapatkan IP Statis dari DHCP dengan [Prefix IP].x.14. hint: fixed address


> _Ensure that all CLIENT, HermioneGranger, and ChoChang use DHCP server configurations, receive DNS from Professor McGonagall, and can access the internet. HermioneGranger and ChoChang must receive static IPs from DHCP with the address [Prefix IP].x.14 (hint: fixed address)._

**Answer:**

- Screenshot

 ![image](https://github.com/user-attachments/assets/0532dd3d-0c15-48a7-ac86-1f5e5a1a6e8d)
 ![image](https://github.com/user-attachments/assets/268824dd-6478-41a8-bf76-05fe39edf539)



- Configuration

Relay DumbleDore
```
apt-get update
apt-get install isc-dhcp-relay -y
service isc-dhcp-relay start

nano /etc/default/isc-dhcp-relay
SERVERS="10.92.3.2"  
INTERFACES="eth1 eth2 eth3 eth4 eth5 eth6"
OPTIONS=

nano /etc/sysctl.conf

net.ipv4.ip_forward=1

service isc-dhcp-relay restart
```

SeverusSnape
```

nano /etc/dhcp/dhcpd.conf

	host ChoChang{
	hardware ethernet 82:d8:23:0d:93:21;
	fixed-address 10.92.6.14;
}

host HermioneGranger {
	hardware ethernet 9a:dc:25:98:53:2f;
	fixed-address 10.92.1.14;
}



```

- Explanation

Konfigurasi di atas memastikan bahwa semua klien, termasuk HermioneGranger dan ChoChang, menggunakan pengaturan dari DHCP server, menerima DNS dari Professor McGonagall, dan memiliki akses ke internet. Untuk HermioneGranger dan ChoChang, alamat IP statis ditetapkan melalui pengaturan fixed-address di DHCP server, masing-masing dengan alamat IP 10.92.1.14 dan 10.92.6.14, berdasarkan alamat MAC mereka. Selain itu, untuk mendukung konfigurasi ini, DHCP relay diatur pada server DumbleDore, yang mengarahkan permintaan DHCP ke server DHCP utama dengan menggunakan isc-dhcp-relay. Konfigurasi ini mencakup pengaturan antarmuka yang relevan dan memastikan pengalihan paket IP diaktifkan dengan net.ipv4.ip_forward=1. Setelah konfigurasi selesai, layanan DHCP relay dan server perlu direstart untuk menerapkan perubahan.

<br>

## Soal 6

> Dimulai dari asrama Gryffindor yang menjadi PHP worker, mereka harus melakukan deployment untuk website berikut menggunakan PHP 7.4.

> _The Gryffindor house, represented by the PHP workers, must deploy the following website using PHP 7.4._

**Answer:**

- Screenshot

  ![Screenshot 2024-10-24 120226](https://github.com/user-attachments/assets/ac3648e1-b800-417a-a887-bb102506e661)


- Configuration
HarryPotter
```
echo nameserver 192.168.122.1 > /etc/resolv.conf
apt-get update
apt-get install nginx -y
apt-get install wget -y
apt-get install unzip -y
apt-get install lynx -y
apt-get install apache2-utils -y
apt-get install php7.4-fpm php7.4-common php7.4-mysql php7.4-gmp php7.4-curl php7.4-intl php7.4-mbstring php7.4-xmlrpc php7.4-gd php7.4-xml php7.4-cli php7.4-zip -y

wget -O '/var/www/gryffindor.hogwarts.c05.com.zip' 'https://drive.google.com/uc?export=download&id=17R4Zcxm3emHq21WdMJzSfCxO8FHqvATM'
unzip -o /var/www/gryffindor.hogwarts.c05.com.zip -d /var/www/

mv /var/www/php /var/www/gryffindor.hogwarts.c05.com

klo biar sampe login lakuin 2x ke atas

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

nano /etc/hosts
127.0.0.1 gryffindor.hogwarts.c05.com


```

- Explanation

Konfigurasi di atas menjelaskan langkah-langkah untuk mendepploy situs web menggunakan PHP 7.4 pada server Nginx untuk asrama Gryffindor. Pertama, nama server DNS diatur ke 192.168.122.1, dan kemudian beberapa paket penting diinstal, termasuk Nginx dan PHP 7.4 dengan modul-modul yang diperlukan. Setelah itu, file situs web diunduh dan diekstrak ke direktori /var/www/, di mana struktur direktori diubah untuk mencerminkan nama domain Gryffindor. File index.php dipindahkan ke lokasi yang tepat, dan hak akses ditetapkan untuk memastikan bahwa server web dapat mengakses file-file tersebut. Konfigurasi server Nginx ditambahkan untuk menangani permintaan HTTP, termasuk pengaturan untuk memproses file PHP melalui FastCGI menggunakan PHP-FPM. Nginx kemudian direstart dan layanan PHP-FPM juga diaktifkan. Akhirnya, entri untuk domain ditambahkan ke file hosts untuk memastikan bahwa server dapat diakses melalui gryffindor.hogwarts.c05.com.

<br>

## Soal 7

> Khusus perlombaan ini, Voldemort sudah jinak dan dia menjadi load balancer untuk para penghuni asrama Gryffindor yang menjadi worker PHP. Aturlah agar Voldemort dapat membagi pekerjaan kepada worker PHP secara optimal. Sebagai pengetesan awal, terapkan algoritma round robin dan lakukan test index.php menggunakan apache benchmark dengan 1000 request dan 100 request/second. Lakukan test sebanyak 3 kali lalu hitung rata-rata dan standar deviasi dari time/request

> _Voldemort, who is now reformed, becomes the load balancer for the Gryffindor PHP workers. Optimize Voldemort to distribute tasks to the PHP workers. For the initial test, apply the round-robin algorithm and test it to the index.php page using Apache Benchmark with 1,000 requests and 100 requests/second. Do the test 3 times and calculate the mean and standard deviation of time/request._

**Answer:**

- Screenshot

 ![Screenshot 2024-10-24 121356](https://github.com/user-attachments/assets/0c3a7cdf-c477-48ee-9eee-aa38defd97be)
 ![Screenshot 2024-10-24 121438](https://github.com/user-attachments/assets/9f05777b-4fc5-4f51-b2cc-692ac07e781a)
 ![Screenshot 2024-10-24 121615](https://github.com/user-attachments/assets/7d26c645-6319-45a7-862e-ac15221b8649)
 ![Screenshot 2024-10-24 121645](https://github.com/user-attachments/assets/f06d0480-e6cc-4366-a802-0f32cb6480dd)
 ![Screenshot 2024-10-24 121707](https://github.com/user-attachments/assets/52fca00b-b88a-4ef5-9550-d72257ad2704)
 ![Screenshot 2024-10-24 121752](https://github.com/user-attachments/assets/0f1a8455-6b57-49cd-816a-fde45a7083d4)
 ![image](https://github.com/user-attachments/assets/b097dfd4-65f3-4bcb-a70a-76c13fd39713)



- Configuration
  
Voldemort :

```
echo 'nameserver 192.168.122.1' > /etc/resolv.conf
apt-get update
apt-get install apache2-utils -y
apt-get install nginx -y
apt-get install lynx -y
service nginx start

echo '
upstream backend  {
server 10.92.1.2;
server 10.92.1.3;
server 10.92.1.4;
}

server {
listen 80;
server_name gryffindor.hogwarts.c05.com;

    	location / {
            	proxy_pass http://backend;
            	proxy_set_header	X-Real-IP $remote_addr;
            	proxy_set_header	X-Forwarded-For $proxy_add_x_forwarded_for;
            	proxy_set_header	Host $http_host;
    	}

error_log /var/log/nginx/lb_error.log;
access_log /var/log/nginx/lb_access.log;

}
' > /etc/nginx/sites-available/load_balancer


unlink /etc/nginx/sites-enabled/default

ln -s /etc/nginx/sites-available/load_balancer /etc/nginx/sites-enabled/

service nginx restart
```

Testing :

```
ab -n 1000 -c 100 http://localhost/index.php
```
- Explanation

Agar Voldemort dapat mendistribusikan pekerjaan secara optimal, diterapkan algoritma round-robin, yang secara bergiliran mengarahkan permintaan ke masing-masing worker. Pengujian awal dilakukan pada halaman index.php menggunakan Apache Benchmark dengan 1.000 request dan 100 request per detik. Pengujian dilakukan sebanyak tiga kali untuk menghitung rata-rata dan standar deviasi dari waktu per request. Nginx digunakan sebagai load balancer, dengan konfigurasi upstream untuk mendistribusikan permintaan ke tiga server worker PHP (IP: 10.92.1.2, 10.92.1.3, dan 10.92.1.4).

<br>

## Soal 8

> Dalam penilaian akhir tahun ini, dibutuhkan algoritma terbaik, cobalah tes 3 algoritma load balancer dengan menggunakan jmeter. Jmeter perlu melakukan login, akses home, dan terakhir logout. Lakukan test dengan 300 thread dan 3 sec ramp up period. Lakukan test sebanyak 3 kali per algoritma, lalu hitung rata-rata dan standar deviasi dari response time. (username: wingardium, password: leviosa)


> _For the final assessment, try three different load-balancing algorithms using JMeter with 300 threads and a 3-second ramp-up period. Jmeter have to be able to login, access homepage, and logout. Do the test 3 times for each algorithm, then calculate the mean and standard deviation of response time. (username: wingardium, password: leviosa)_

**Answer:**

- Screenshot


- Configuration

Voldemort 
```
echo nameserver 192.168.122.1 > /etc/resolv.conf
apt-get install openjdk-11-jre
wget https://dlcdn.apache.org//jmeter/binaries/apache-jmeter-5.6.3.zip
unzip apache-jmeter-5.6.3.zip

echo '
upstream backend  {
least_conn; # ganti algoritma
server 10.92.1.2;
server 10.92.1.3;
server 10.92.1.4;
}

server {
listen 80;
server_name gryffindor.hogwarts.c05.com;

    	location / {
            	proxy_pass http://backend;
            	proxy_set_header	X-Real-IP $remote_addr;
            	proxy_set_header	X-Forwarded-For $proxy_add_x_forwarded_for;
            	proxy_set_header	Host $http_host;
    	}

error_log /var/log/nginx/lb_error.log;
access_log /var/log/nginx/lb_access.log;

}
' > /etc/nginx/sites-available/load_balancer


unlink /etc/nginx/sites-enabled/default

ln -s /etc/nginx/sites-available/load_balancer /etc/nginx/sites-enabled/

service nginx restart
```

Jmeter

```
./jmeter -n -t load -l <load.csv> -e -o <load_output>

apt-get installl zip
zip -r  load.zip load_output/
curl -X POST -F "file=@./load.zip" https://webhook.site/7cadb9e9-247c-4692-ab6a-2bc849c701a7

./jmeter -n -t load1.jmx -l load1.csv -e -o load1_output
zip -r  load1.zip load1_output/
curl -X POST -F "file=@./load1.zip" https://webhook.site/7cadb9e9-247c-4692-ab6a-2bc849c701a7
```


- Explanation

Pada Voldemort, konfigurasi Nginx menggunakan algoritma load balancing least_conn, round roubin, ip hash yang mendistribusikan permintaan ke tiga server backend (10.92.1.2, 10.92.1.3, dan 10.92.1.4) berdasarkan koneksi yang paling sedikit. File konfigurasi Nginx disimpan di /etc/nginx/sites-available/load_balancer dan diaktifkan dengan membuat symbolic link. Nginx kemudian di-restart untuk menerapkan perubahan. <br>

JMeter digunakan untuk menjalankan pengujian otomatis login, akses homepage, dan logout dengan 300 thread dan ramp-up 3 detik. Tes dilakukan tiga kali untuk setiap algoritma load balancing, dan hasilnya disimpan dalam file CSV, kemudian dikompres dan dikirim menggunakan curl.<br>

<br>


## Soal 9

> Tidak semua IP dapat akses asrama Gryffindor melalui IP Load balancer Voldemort. Untuk itu, berikan akses pada load balancer Voldemort. Autentikasi akan memerlukan username: “jarkom” dan password: “modul3”. Simpan file autentikasi pada  /etc/nginx/secretchamber 

> _Not all IPs can access Gryffindor's house through Voldemort’s load balancer. Grant access to the Voldemort load balancer. Authentication will require username: “jarkom” and password: “modul3”. Save the authentication file in /etc/nginx/secretchamber._

**Answer:**

- Screenshot

![image](https://github.com/user-attachments/assets/297e23e1-cf75-4a13-90d5-0d8089b101bc)
![image](https://github.com/user-attachments/assets/a786a8fc-f9e1-4d9d-bcbe-a90f3952a8b4)



- Configuration

Voldemort :
```
service nginx start

echo '
upstream backend {
    ip_hash;
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
        auth_basic "Restricted Access"; 
        auth_basic_user_file /etc/nginx/secretchamber/.htpasswd;
    }

    error_log /var/log/nginx/lb_error.log;
    access_log /var/log/nginx/lb_access.log;
}
' > /etc/nginx/sites-available/load_balancer

service nginx restart

echo '127.0.0.1 gryffindor.hogwarts.c05.com' >> /etc/hosts
```
Testing :

```
lynx gryffindor.hogwarts.c05.com
```
- Explanation

Konfigurasi ini membatasi akses ke server Gryffindor melalui load balancer Voldemort dengan menambahkan autentikasi berbasis username dan password. Pertama, Nginx dikonfigurasi untuk menggunakan load balancing dengan algoritma ip_hash yang mengarahkan lalu lintas ke tiga server backend (10.92.1.2, 10.92.1.3, 10.92.1.4). Pada bagian location, autentikasi dasar (auth_basic) diaktifkan, memerlukan username "jarkom" dan password "modul3", dengan data autentikasi disimpan di file /etc/nginx/secretchamber/.htpasswd. Setelah konfigurasi selesai, layanan Nginx di-restart dan hostname gryffindor.hogwarts.c05.com ditambahkan ke file /etc/hosts untuk memastikan pengujian lokal dapat dilakukan menggunakan browser teks lynx.

<br>

## Soal 10

> Setelah menambahkan autentikasi ke Gryffindor, coba testing ulang dengan menggunakan JMeter (algoritma round robin) serta skenario, thread, dan ramp up period yang sama seperti no 8 (300 thread, 3 sec ramp up period, login-home-logout). Kali ini, coba juga jumlah worker yang berbeda: 3 worker, 2 worker, dan 1 worker. 

> _After adding authentication to Gryffindor, retest using JMeter (round-robin algorithm) with the same scenario, thread, and ramp up period as number 8 (300 thread, 3 sec ramp up period, login-home-logout). This time, test with different numbers of workers: 3 workers, 2 workers, and 1 worker._

**Answer:**

- Screenshot
![image](https://github.com/user-attachments/assets/ed32687d-ca15-4fa7-a6d7-87f69ce986ec)



- Configuration

Voldemort 
```
 echo '
upstream backend  {
server 10.92.1.2;
server 10.92.1.3;
server 10.92.1.4;
}

server {
listen 80;
server_name gryffindor.hogwarts.c05.com;

    	location / {
            	proxy_pass http://backend;
            	proxy_set_header	X-Real-IP $remote_addr;
            	proxy_set_header	X-Forwarded-For $proxy_add_x_forwarded_for;
            	proxy_set_header	Host $http_host;
		auth_basic "Restricted Access"; 
auth_basic_user_file /etc/nginx/secretchamber/.htpasswd;
    	}


error_log /var/log/nginx/lb_error.log;
access_log /var/log/nginx/lb_access.log;

}
' > /etc/nginx/sites-available/load_balancer
```
Jmeter 
```
./jmeter -n -t 1workers.jmx -l 1workers.csv -e -o 1workers_output
zip -r  1workers.zip 1workers_output/
curl -X POST -F "file=@./1workers.zip" https://webhook.site/7cadb9e9-247c-4692-ab6a-2bc849c701a7

./jmeter -n -t 2workers.jmx -l 2workers.csv -e -o 2workers_output
zip -r  2workers.zip 2workers_output/
curl -X POST -F "file=@./2workers.zip" https://webhook.site/7cadb9e9-247c-4692-ab6a-2bc849c701a7

./jmeter -n -t 3workers.jmx -l 3workers.csv -e -o 3workers_output
zip -r  3workers.zip 3workers_output/
curl -X POST -F "file=@./3workers.zip" https://webhook.site/7cadb9e9-247c-4692-ab6a-2bc849c701a7
```


- Explanation

Pada konfigurasi ini, server menggunakan load balancer Nginx dengan algoritma round-robin untuk mendistribusikan beban ke tiga server backend (10.92.1.2, 10.92.1.3, dan 10.92.1.4). Load balancer mendengarkan pada port 80 dengan nama domain gryffindor.hogwarts.c05.com. Otentikasi dasar (basic authentication) diterapkan untuk mengamankan akses menggunakan file .htpasswd yang tersimpan di /etc/nginx/secretchamber/. Log akses dan error masing-masing dicatat dalam file /var/log/nginx/lb_access.log dan /var/log/nginx/lb_error.log. Pengujian dilakukan dengan JMeter menggunakan skenario "login-home-logout" dengan 300 thread, 3 detik ramp up, dan variasi jumlah worker (1, 2, dan 3). Hasil pengujian disimpan dalam file output yang dikompresi dan dikirimkan melalui curl ke webhook yang ditentukan.


<br>

## Soal 11

> Hogwarts juga bekerjasama dengan ITS dalam perlombaan ini. Untuk itu, setiap request pada Voldemort yang mengandung /informatika pada akhir url akan di proxy passing menuju halaman https://www.its.ac.id/informatika/id/beranda/ 

> _Hogwarts has also partnered with ITS for this competition. Any request to Voldemort containing /informatika at the end of the URL should be proxied to the page at https://www.its.ac.id/informatika/id/beranda/._


**Answer:**

- Screenshot

![image](https://github.com/user-attachments/assets/b4512dad-ec02-42e3-8f0c-35c2d71663ee)


- Configuration

Voldemort

```
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
```
Testing :

```
lynx gryffindor.hogwarts.c05.com/informatika
```
- Explanation

Konfigurasi di atas menjelaskan bahwa server Voldemort, bagian dari sistem load balancer untuk domain gryffindor.hogwarts.c05.com, akan menangani dua jenis request. Pertama, semua permintaan umum akan diarahkan ke backend server yang diatur dalam upstream backend. Kedua, jika URL berisi /informatika di akhir, request tersebut akan diproxy ke halaman ITS pada URL https://www.its.ac.id/informatika/id/beranda/. Selain itu, beberapa header penting seperti Host, X-Real-IP, X-Forwarded-For, dan X-Forwarded-Proto akan diteruskan untuk memastikan informasi pengguna tetap terjaga. Error dan akses akan dicatat pada log di Nginx.

<br>

## Soal 12

> Selain butuh autentikasi dalam pengaksesan asrama Gryffindor melalui LB Voldemort, juga perlu dibatasi dengan pembatasan IP.  LB Voldemort hanya boleh diakses oleh client dengan IP [Prefix IP].2.64, [Prefix IP].2.100, [Prefix IP].5.50, dan [Prefix IP].5.155. hint: (fixed in dulu clientnya) 


> _In addition to requiring authentication for access to Gryffindor through Voldemort’s load balancer, IP restrictions also need to be enforced. Voldemort's load balancer can only be accessed by clients with IPs: [Prefix IP].2.64, [Prefix IP].2.100, [Prefix IP].5.50, and [Prefix IP].5.155. (hint: fixed client IPs first)._

**Answer:**

- Screenshot

![image](https://github.com/user-attachments/assets/2e46e3e1-7a91-4d47-a915-d1a35a128410)


- Configuration

```
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

        # Autentikasi untuk mengakses asrama Gryffindor
        auth_basic "Restricted Access";
        auth_basic_user_file /etc/nginx/secretchamber/.htpasswd;

        # Pembatasan akses berdasarkan IP
        allow 10.92.2.64;
        allow 10.92.2.100;
        allow 10.92.5.50;
        allow 10.92.5.155;
        deny all;
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

```

- Explanation

Konfigurasi di atas menambahkan autentikasi dan pembatasan akses berbasis IP untuk load balancer Voldemort, yang melayani asrama Gryffindor di domain gryffindor.hogwarts.c05.com. Autentikasi menggunakan file .htpasswd untuk membatasi akses hanya kepada pengguna yang berwenang. Selain itu, hanya klien dengan IP tertentu yang diizinkan mengakses load balancer, yaitu: 10.92.2.64, 10.92.2.100, 10.92.5.50, dan 10.92.5.155, sementara semua IP lainnya ditolak dengan menggunakan perintah deny all.

<br>

## Soal 13

> Pengaturan database yang dibutuhkan dalam perlombaan ini wajib diatur di Hagrid. Pastikan pengaturan database tersebut dapat diakses oleh Lunalovegood, FiliusFlitwick, dan ChoChang dengan menggunakan username: kelompokyyy dan password: passwordyyy 

> _Database setup for this competition is managed by Hagrid. Ensure that this database can be accessed by LunaLovegood, FiliusFlitwick, and ChoChang using the username: "kelompokyyy" and password: "passwordyyy”_

**Answer:**

- Screenshot

 ![image](https://github.com/user-attachments/assets/137e411b-f064-498c-aa57-fcc16317f8a6)


- Configuration

Hagrid
```
apt-get update
apt-get install mariadb-server -y
service mysql start
mysql

CREATE USER 'kelompokc05'@'10.92.6.4' IDENTIFIED BY 'passwordc05';
CREATE USER 'kelompokc05'@'10.92.6.3' IDENTIFIED BY 'passwordc05';
CREATE USER 'kelompokc05'@'10.92.6.2' IDENTIFIED BY 'passwordc05';
CREATE DATABASE dbkelompokc05;
GRANT ALL PRIVILEGES ON dbkelompokc05.* TO 'kelompokc05'@'10.92.6.4';
GRANT ALL PRIVILEGES ON dbkelompokc05.* TO 'kelompokc05'@'10.92.6.3';
GRANT ALL PRIVILEGES ON dbkelompokc05.* TO 'kelompokc05'@'10.92.6.2';

FLUSH PRIVILEGES;

nano /etc/mysql/my.cnf
[mysqld]
skip-networking=0
skip-bind-addre
```

Luna
```
apt-get install mariadb-client -y
mariadb --host=10.92.4.2 --port=3306 --user=kelompokc05 --password
```
- Explanation

Konfigurasi ini bertujuan untuk mengatur akses database yang dikelola oleh server Hagrid bagi pengguna tertentu dalam perlombaan. Pertama, MariaDB diinstal dan dijalankan di Hagrid. Selanjutnya, tiga pengguna diizinkan untuk mengakses database dengan username kelompokc05 dan password passwordc05, yang masing-masing berasal dari alamat IP 10.92.6.2, 10.92.6.3, dan 10.92.6.4. Sebuah database bernama dbkelompokc05 juga dibuat, dan hak akses penuh diberikan kepada ketiga pengguna tersebut untuk database ini. Selain itu, konfigurasi diatur untuk memastikan jaringan dapat diakses dengan mengedit file konfigurasi MySQL agar mengizinkan koneksi jaringan. Di sisi klien (Luna), MariaDB client diinstal untuk menghubungkan ke server database menggunakan kredensial yang telah ditentukan.

<br>

## Soal 14

> Selain itu, untuk Lunalovegood, FiliusFlitwick, dan ChoChang memiliki website sesuai dengan https://github.com/lodaogos/laravel-jarkom-modul-3/tree/main  berikut. Jangan lupa melakukan instalasi PHP8.0 dan Composer! Pastikan database di Hagrid sudah ada isinya sekarang dan server Laravel sudah running di localhost!

> _Additionally, LunaLovegood, FiliusFlitwick, and ChoChang have websites following this GitHub link: Laravel Jarkom Modul 3. Install PHP 8.0 and Composer! Make sure Hagrid's data storage is populated, and the Laravel servers are running on localhost!_

**Answer:**

- Screenshot

  `Put your screenshot in here`

- Configuration

  `Put your configuration in here`

- Explanation

  `Put your explanation in here`

<br>

## Soal 15

> Lakukan testing endpoint /register sebanyak 100 request dengan 10 request/second di salah satu worker menggunakan apache benchmark dari SusanBones! Kenapa failed 99x? Jelaskan! 

> _Test the /register endpoint with 100 requests and 10 requests per second on one of the workers using Apache Benchmark from SusanBones! Why did 99 tests fail? Explain!_

**Answer:**

- Screenshot

  ![Screenshot 2024-10-25 152336](https://github.com/user-attachments/assets/5a2172c1-03a1-4744-9469-c18b758ac7d8)


  ![Screenshot 2024-10-25 152348](https://github.com/user-attachments/assets/63d33f07-dd71-4f33-baa9-27836c1400a1)

  


- Configuration

  Susaan Bones
  ```
	apt-get update
	apt-get install apache2-utils -y
	apt-get install nginx -y
	apt-get install lynx -y

	cd ~
	echo '{"username":"testuser","password":"testpass"}' > register.json
	
	ab -n 100 -c 10 -p register.json -T application/json http://10.92.6.4:8001/api/auth/register
  ```
  


- Explanation

Konfigurasi ini menginstal Apache Utilities (untuk alat ab), NGINX sebagai server web, dan Lynx untuk akses web berbasis teks. Kemudian, dibuat file register.json berisi data username dan password sebagai payload JSON untuk pengujian API. Dengan menggunakan ab, endpoint /api/auth/register diuji dengan 100 permintaan (10 permintaan bersamaan) untuk mengevaluasi performa server dalam menangani beban tersebut.

<br>

## Soal 16

> Lakukan juga testing pada endpoint /login sebanyak 100 request dengan 10 request/second di salah satu worker menggunakan apache benchmark dari SusanBones! Dapatkan token melalui responsenya juga!

> _Test the /login endpoint with 100 requests and 10 requests per second on one of the workers using Apache Benchmark from SusanBones! Collect the token from the response!_

**Answer:**

- Screenshot

  ![Screenshot 2024-10-25 153552](https://github.com/user-attachments/assets/44510b32-decf-42ab-8980-f38466a8dd99)

  ![Screenshot 2024-10-25 153559](https://github.com/user-attachments/assets/a7a73dd4-e94b-4e47-87c7-1e13edbad683)

  ![Screenshot 2024-10-25 154440](https://github.com/user-attachments/assets/c60cdef0-4510-455e-836a-070bf04723f9)


- Configuration

  SusanBones

  ```
	apt-get update
	apt-get install apache2-utils -y
	apt-get install nginx -y
	apt-get install lynx -y
	
	ab -n 100 -c 10 -p register.json -T application/json http://10.92.6.4:8001/api/auth/login
  ```
Token
	
`curl -X POST -H "Content-Type: application/json" -d @register.json http://10.92.6.4:8001/api/auth/login`

eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOi8vMTAuOTIuNi40OjgwMDEvYXBpL2F1dGgvbG9naW4iLCJpYXQiOjE3Mjk4NDU4NzUsImV4cCI6MTcyOTg0OTQ3NSwibmJmIjoxNzI5ODQ1ODc1LCJqdGkiOiJCOTRGN1ZFWmJ6cWoydE9jIiwic3ViIjoiMSIsInBydiI6IjIzYmQ1Yzg5NDlmNjAwYWRiMzllNzAxYzQwMDg3MmRiN2E1OTc2ZjcifQ.lYvK04ED2aSvM3isjD87zII2yxr0v4gKItDXXd4iN5w


- Explanation

  `Put your explanation in here`

<br>

## Soal 17

> Coba testing pada endpont /me sebanyak 100 request dengan 10 request/second di salah satu worker menggunakan apache benchmark dari SusanBones! Periksa responsenya apakah sudah sesuai dengan yang diloginkan? 

> _Test the /me endpoint with 100 requests and 10 requests per second on one of the workers using Apache Benchmark from SusanBones! Check if the response matches the logged-in user!_

**Answer:**

- Screenshot

  `Put your screenshot in here`

- Configuration

  `Put your configuration in here`

- Explanation

  `Put your explanation in here`

<br>

## Soal 18

> Mendekati tugas akhir perlombaan ini, mari seimbangkan kekuatan LunaLovegood, FiliusFlitwick, dan ChoChang untuk bekerja sama secara adil! Buatkan load balancer Laravel dengan Dementor dan implementasikan Proxy Bind untuk mengaitkan IP dari ketiga worker tersebut!

> _As the competition nears its end, balance the workload of LunaLovegood, FiliusFlitwick, and ChoChang! Create a Laravel load balancer using Dementor and implement Proxy Bind to link the IPs of the three workers!_

**Answer:**

- Screenshot

  `Put your screenshot in here`

- Configuration

  `Put your configuration in here`

- Explanation

  `Put your explanation in here`

<br>

## Soal 19

> Untuk menguatkan para Laravel Worker, coba implementasikan PHP-FPM pada LunaLovegood, FiliusFlitwick, dan ChoChang. Untuk testing kinerja naikkan: 
pm.max_children
pm.start_servers
pm.min_spare_servers
pm.max_spare_servers
sebanyak tiga percobaan dan lakukan analisis testing menggunakan apache benchmark sebanyak 100 request dengan 10 request/second atau menggunakan jmeter dengan 100 threads! (Pilih 1 metode testing)

> _To strengthen the Laravel workers, implement PHP-FPM on LunaLovegood, FiliusFlitwick, and ChoChang. For performance testing, adjust: pm.max_children, pm.start_servers, pm.min_spare_servers, pm.max_spare_servers. Run the tests three times and analyze the performance by using Apache Benchmark with 100 requests at a rate of 10 requests per second or using JMeter with 100 threads! (Choose 1 testing method)_

**Answer:**

- Screenshot

  `Put your screenshot in here`

- Configuration

  `Put your configuration in here`

- Explanation

  `Put your explanation in here`

<br>

## Soal 20

> Yey terakhir. Menurut Professor Dumbledore, sepertinya menggunakan PHP-FPM tidak cukup untuk meningkatkan performa worker-worker. Implementasikan Least-Conn pada Dementor. Lakukan analisis pada testing kinerja menggunakan apache benchmark sebanyak 100 request dengan 10 request/second atau menggunakan jmeter dengan 100 threads! (Pilih 1 metode testing)

> _Finally, Professor Dumbledore suggests that PHP-FPM might not be enough to improve the workers' performance. Implement the Least-Conn algorithm on Dementor. Analyze the performance by using Apache Benchmark with 100 requests at a rate of 10 requests per second or using JMeter with 100 threads! (Choose 1 testing method)_

**Answer:**

- Screenshot

  `Put your screenshot in here`

- Configuration

  `Put your configuration in here`

- Explanation

  `Put your explanation in here`

<br>
  
## Problems

## Revisions (if any)
