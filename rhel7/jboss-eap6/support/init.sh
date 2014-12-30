#!/bin/sh

IP_ADDR=$(hostname -i)
HOST_NAME=$(hostname -s)

$JBOSS_HOME/bin/standalone.sh -b $IP_ADDR -bmanagement=$IP_ADDR $@ 
