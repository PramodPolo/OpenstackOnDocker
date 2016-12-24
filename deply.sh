#!/usr/bin/sh
echo "Deploying Openstack Newton please wait..."
echo "Installing dependencies..."
apt-get update
apt-get install lvm2 git software-properties-common python-software-properties -y
add-apt-repository cloud-archive:newton -y
apt-get install openvswitch-switch -y
docker run -itd -p 80:80 -p 6080:6080 --privileged --device=/dev/sdb:/dev/sdb -v /var/run/lvm/lvmetad.socket:/var/run/lvm/lvmetad.socket -v /lib/modules/:/lib/modules mohamedji/openstack /bin/bash
sleep 1m
ip = (/sbin/ip -o -4 addr list eth0 | awk '{print $4}' | cut -d/ -f1)
echo "Connect to Openstack on http://"+ip+"/horizon"
echo "Username:admin"
echo "Password:admin_pass"