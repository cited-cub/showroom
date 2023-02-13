#!/bin/bash
echo RedHat username: $REDHATUSERNAME
echo RedHat password: $REDHATPASSWORD
sudo subscription-manager register --username $REDHATUSERNAME --password $REDHATPASSWORD --auto-attach
sudo subscription-manager repos --enable ansible-2.9-for-rhel-8-x86_64-rpms
sudo yum install -y dnf-plugins-core
sudo yum config-manager --disable epel epel-modular
sudo yum install -y ansible