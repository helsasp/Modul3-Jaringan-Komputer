echo '  
host HermioneGranger {
    hardware ethernet 9a:dc:25:98:53:2f;
    fixed-address 10.92.1.14;
}

host ChoChang {
    hardware ethernet 82:d8:23:0d:93:21;
    fixed-address 10.92.6.14;
}' > /etc/dhcp/dhcpd.conf

service isc-dhcp-server restart