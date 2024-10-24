service isc-dhcp-relay start


echo 'SERVERS="10.92.3.2"' > /etc/default/isc-dhcp-relay
echo 'INTERFACES="eth1 eth2 eth3 eth4 eth5 eth6"' >> /etc/default/isc-dhcp-relay
echo 'OPTIONS=""' >> /etc/default/isc-dhcp-relay 


echo 'net.ipv4.ip_forward=1' > /etc/sysctl.conf


service isc-dhcp-relay restart

