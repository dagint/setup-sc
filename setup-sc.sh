#!/bin/bash

intbantime=86400
#update apt repo
apt-get update
#install fail2ban and ufw if not present
apt-get install fail2ban ufw -y

#Configure ufw firewall
ufw status verbose
ufw default allow outgoing
ufw default deny incoming
ufw allow ssh
ufw allow http 
ufw allow https
ufw allow 8042/tcp
ufw enable

#Copy jail.conf to jail.local
cp /etc/fail2ban/jail.conf /etc/fail2ban/jail.local
sed -i 's/^bantime .*/bantime = $intbantime/g' /etc/fail2ban/jail.local


