#!/bin/bash
# echo RedHat username: $REDHATUSERNAME
# echo RedHat password: $REDHATPASSWORD
# sudo subscription-manager register --username $REDHATUSERNAME --password $REDHATPASSWORD --auto-attach
# sudo subscription-manager repos --enable ansible-2.9-for-rhel-8-x86_64-rpms
# sudo yum install -y dnf-plugins-core
# sudo yum config-manager --disable epel epel-modular
# sudo yum install -y ansible

# chmod go-rw elk.key
ansible elk --private-key elk.key -u vagrant -m user -a "name=tux"
echo "tux ALL=(root) NOPASSWD: ALL" > tux
ansible elk --private-key elk.key -u vagrant -m copy -a "src=tux dest=/etc/sudoers.d/"
# ssh-keygen
ansible elk --private-key elk.key -u vagrant -m authorized_key -a "user=tux state=present key='{{ lookup('file','/home/vagrant/.ssh/id_rsa.pub')}}'"
