#!/bin/bash
JMETER_VERSION=5.1.1
JMETER_HOME=/opt/apache-jmeter

apt-get -y update
apt install -y openjdk-8-jre
apt install -y openjdk-8-jdk

#Download JMeter
echo "Downloading JMeter ${JMETER_VERSION}..."
curl -s https://archive.apache.org/dist/jmeter/binaries/apache-jmeter-${JMETER_VERSION}.tgz \
        > apache-jmeter-${JMETER_VERSION}.tgz \
    && tar xzf apache-jmeter-${JMETER_VERSION}.tgz \
    && rm apache-jmeter-${JMETER_VERSION}.tgz \
    && sudo mv apache-jmeter-${JMETER_VERSION} ${JMETER_HOME}
echo "JMeter was successfully downloaded to the ${JMETER_HOME}"

# TODO add JMeter plugins downloading
cd ${JMETER_HOME} \
    && curl -sL 'http://search.maven.org/remotecontent?filepath=kg/apc/jmeter-plugins-manager/1.3/jmeter-plugins-manager-1.3.jar' \
        > lib/ext/jmeter-plugins-manager-1.3.jar

#Extend ip ranges
echo 1025 60999 > /proc/sys/net/ipv4/ip_local_port_range
echo 65536 > /proc/sys/net/ipv4/tcp_max_tw_buckets
echo 1 > /proc/sys/net/ipv4/tcp_tw_reuse