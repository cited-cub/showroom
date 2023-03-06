#!/bin/bash
ip_node01=$(dig +short node01 | sort | head -n1)
ip_node02=$(dig +short node02 | sort | head -n1)
#echo $ip_node01 smtp1.example.com smtp1 >> /etc/hosts
#echo $ip_node02 smtp2.example.com smtp2 >> /etc/hosts
apt-get update
DEBIAN_PRIORITY=low apt-get install -y postfix
systemctl start postfix
echo root: bob >> /etc/aliases
newaliases
systemctl restart postfix
postconf -e 'mailbox_size_limit=20480000'
systemctl restart postfix
apt-get install s-nail
