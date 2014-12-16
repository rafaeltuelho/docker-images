#!/bin/bash

IPADDR=$(ip a s | sed -ne '/127.0.0.1/!{s/^[ \t]*inet[ \t]*\([0-9.]\+\)\/.*$/\1/p}')

#/opt/jboss-eap-6.3/bin/standalone.sh -b node1 -bmanagement=node1 -c standalone-ha.xml -Djboss.socket.binding.port-offset=0 -Djboss.node.name=node1 -Djgroups.bind_addr=node1
/usr/share/wildfly/bin/standalone.sh -c standalone-ha.xml -Djboss.bind.address=$IPADDR -Djboss.bind.address.management=$IPADDR -Djboss.node.name=server-$IPADDR
