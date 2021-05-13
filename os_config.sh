#!/bin/bash
apt-get -y update
apt install -y openjdk-8-jre
apt install -y openjdk-8-jdk

echo 1025 60999 > /proc/sys/net/ipv4/ip_local_port_range
echo 65536 > /proc/sys/net/ipv4/tcp_max_tw_buckets
echo 1 > /proc/sys/net/ipv4/tcp_tw_reuse