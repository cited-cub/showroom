#!/bin/bash
ip_node01=$(dig +short node01 | sort | head -n1)
ip_node02=$(dig +short node02 | sort | head -n1)
ip_network=$(echo $ip_node01 | sed -E 's/\.[0-9]{1,3}$/\.0\/24/g') 
echo $ip_node01 smtp1.example.com smtp1 node01 >> /etc/hosts
echo $ip_node02 smtp2.example.com smtp2 node02 >> /etc/hosts
apt-get update
debconf-set-selections <<< "postfix postfix/main_mailer_type string 'Internet Site'"
debconf-set-selections <<< "postfix postfix/mailname string $HOSTNAME"
debconf-set-selections <<< "postfix postfix/root_address string bob"
debconf-set-selections <<< "postfix postfix/root_address string bob"
debconf-set-selections <<< "postfix postfix/destinations string $myhostname,smtp1.example.com,node01,localhost"
debconf-set-selections <<< "postfix postfix/root_address string bob"
debconf-set-selections <<< "postfix postfix/chattr boolean false"
debconf-set-selections <<< "postfix postfix/mynetworks string 127.0.0.0/8 [::ffff:127.0.0.0]/104 [::1]/128 $ip_network"
debconf-set-selections <<< "postfix postfix/mailbox_limit string 1000000"
debconf-set-selections <<< "postfix postfix/recipient_delim string +"
debconf-set-selections <<< "postfix postfix/protocols string ipv4"
DEBIAN_PRIORITY=low apt-get install -y postfix
systemctl start postfix
echo root: bob >> /etc/aliases
newaliases
systemctl restart postfix
postconf -e 'mailbox_size_limit=20480000'
systemctl restart postfix
apt-get install s-nail
