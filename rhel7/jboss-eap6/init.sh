#!/bin/bash

IPADDR=$(ip a s | sed -ne '/127.0.0.1/!{s/^[ \t]*inet[ \t]*\([0-9.]\+\)\/.*$/\1/p}')
HOST_ADDR=$(hostname -i)
HOST_NAME=$(hostname -s)

# some properties to avoid JGroups issues when using cluster/ha profiles
JVM_PROPS="-Djboss.node.name=$HOST_NAME -Djgroups.bind_addr=$HOST_ADDR"
# when using mod_cluster, change the default node name
JVM_PROPS="$JVM_PROPS -Djboss.mod_cluster.jvmRoute=$HOST_NAME -DjvmRoute=$HOST_NAME"

$JBOSS_HOME/bin/standalone.sh -b $HOST_ADDR -bmanagement=$HOSTADDR $@
