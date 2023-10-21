#!/bin/bash

# Find IP addresse of a domain
nslookup google.com

# Find the Ruter IP address
curl ininfo.io

# how to find private ip of host machine?
ifconfig

# how to change private ip of a ubuntu machine?
cd /etc/netplan/

# current configuration
#########################################################################
# network:
#   version: 2
#   renderer: networkd
#   ethernets:
#     enp0s8:
#       addresses:
#       - 192.168.33.10/24
#     enp0s9:
#       dhcp4: true
#########################################################################

apt install network-manager # In my vm, network-manager was absent
systemctl stopt network-manager # Stop network-manager to prevent error while changing network configuration

# change configuration ( new configuration is attached below)
#########################################################################
# network:
#   version: 2
#   renderer: networkd
#   ethernets:
#     enp0s8:
#       dhcp4: false
#       addresses:
#       - 192.168.33.98/24
#       gateway4: 192.168.0.1
#     enp0s9:
#       dhcp4: true
##########################################################################

# Check if the configurations are applied
ifconfig enp0s8 # For my vm, enp0s8 is the active adapter

# output
# enp0s8: flags=4163<UP,BROADCAST,RUNNING,MULTICAST>  mtu 1500
#         inet 192.168.33.98  netmask 255.255.255.0  broadcast 192.168.33.255
#         inet6 fe80::a00:27ff:fe99:27a0  prefixlen 64  scopeid 0x20<link>
#         ether 08:00:27:99:27:a0  txqueuelen 1000  (Ethernet)
#         RX packets 0  bytes 0 (0.0 B)
#         RX errors 0  dropped 0  overruns 0  frame 0
#         TX packets 77  bytes 5906 (5.9 KB)
#         TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0

#? The IP has been changed to 192.168.33.98

#! The end of the First 4 commands

# --------------------------------------------------------------------------------------
# --------------------------------------------------------------------------------------
# --------------------------------------------------------------------------------------


# check ports open in the current system?
netstat -tunlp

# enable port 80 and 3306 in vm
# For this task, we need to install nginx/apache2 to listen to the port 80 and
# mysql-server to listen to the port 3306
#? Install nginx and mysql-server

apt install nginx
apt install mysql-server

# check if the ports are active or not
#output 
# Proto Recv-Q Send-Q Local Address           Foreign Address         State       PID/Program name
# tcp        0      0 0.0.0.0:80              0.0.0.0:*               LISTEN      17726/nginx: master
# tcp        0      0 127.0.0.53:53           0.0.0.0:*               LISTEN      903/systemd-resolve
# tcp        0      0 0.0.0.0:22              0.0.0.0:*               LISTEN      1496/sshd
# tcp        0      0 127.0.0.1:3306          0.0.0.0:*               LISTEN      18424/mysqld
# tcp        0      0 10.0.2.15:22            10.0.2.2:63724          ESTABLISHED 3073/sshd: vagrant
# tcp        0     36 10.0.2.15:22            10.0.2.2:63725          ESTABLISHED 3155/sshd: vagrant
# tcp        0      0 10.0.2.15:22            10.0.2.2:63700          ESTABLISHED 2953/sshd: vagrant
# tcp6       0      0 :::80                   :::*                    LISTEN      17726/nginx: master
# tcp6       0      0 :::22                   :::*                    LISTEN      1496/sshd

#? port 80 and 3306 ar active now

# download any file or software using terminal
curl https://www.tooplate.com/zip-templates/2136_kool_form_pack.zip


# get web data response from terminal
curl http://192.168.33.98/ # Send request to my default nginx page


# - install nginx webserver in the vm and access the welcome nginx         page from web browser
# - create a mysql database server in vm and access it from host machine

# I installed these services earlier by writing the commands below
apt install nginx
apt install mysql-server

# - replace default nginx page with an index.html page containing your name and access it from web browser
# Create a index.html and replace the default index.html page with it
# sudo cp index.html /usr/share/nginx/html/
# # Bounce the nginx service
# systemctl restart nginx



