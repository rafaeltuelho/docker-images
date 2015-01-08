#!/bin/sh

#IP_ADDR=$(ip a s | sed -ne '/127.0.0.1/!{s/^[ \t]*inet[ \t]*\([0-9.]\+\)\/.*$/\1/p}')
HOST_ADDR=$(hostname -i)
HOST_NAME=$(hostname -s)

# some properties to avoid JGroups issues when using cluster/ha profiles
JVM_PROPS="-Djboss.node.name=$HOST_NAME -Djgroups.bind_addr=$HOST_ADDR"
# when using mod_cluster, change the default node name
JVM_PROPS="$JVM_PROPS -Djboss.mod_cluster.jvmRoute=$HOST_NAME -DjvmRoute=$HOST_NAME"

# TODO: try to apply a patch (if exists)

# bind the public interface to 0.0.0.0 due a issue with mod_cluster advertize (
#	NOTE: I really don't know why yet, but the multicast advertize on RHEL7 Docker container only works 
# 	      if I bind the public interface of JBoss EAP node to 0.0.0.0 addr)
#	      Maybe I'm doing something wrong :-/
$JBOSS_HOME/bin/standalone.sh -b 0.0.0.0 -bunsecure=$HOST_ADDR -bmanagement=$HOST_ADDR $@ $JVM_PROPS 
