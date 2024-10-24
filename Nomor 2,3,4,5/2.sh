echo 'INTERFACESv4="eth0"' > /etc/default/isc-dhcp-server

echo '
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

host HermioneGranger {
    hardware ethernet 9a:dc:25:98:53:2f;
    fixed-address 10.92.1.14;
}

host ChoChang {
    hardware ethernet 82:d8:23:0d:93:21;
    fixed-address 10.92.6.14;
}' > /etc/dhcp/dhcpd.conf
