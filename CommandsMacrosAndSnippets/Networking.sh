# Host name and IP address
# # All IP addresses
ip a
# # IPv4 address per interface
ip addr show eth0 | grep 'inet'
hostname -I
