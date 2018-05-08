#!/bin/bash

apt-get update
apt-get install fail2ban ufw

ufw status verbose
ufw default allow outgoing
ufw default deny incoming
ufw allow ssh
ufw allow http 
ufw allow https
ufw allow 8042/tcp
ufw enable
