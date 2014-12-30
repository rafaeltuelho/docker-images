* to Build

  ```sudo docker build --force-rm -t rsoares/rhel7-jboss-eap6 . ```

* to Run

  ```sudo docker run -ti --name eap6 <username>/rhel7-jboss-eap6```

* to access the Container's bash

  ```sudo docker exec -ti eap6 /bin/bash```

* to get the IP addr and then

  ```sudo docker inspect --format '{{ .NetworkSettings.IPAddress }}' eap6```

* to access the EAP Admin Console

```
http://<conatiner's IP Addr>:9990/console
  user: admin
  pwd: jboss@eap6! 
```

* to start EAP6 with another profile, pass the '-c' parameter on statup cmd line, like:

```
sudo docker run -d --name eap6 <username>/rhel7-jboss-eap6 -c standalone-ha.xml
```

the cmd line above will start EAP6 using a cluster profile (standalone-ha.xml)


* to start multiples containers with EAP in standalone mode (and clustered profile) use:

```
sudo docker run -d --name eap6_x -p 8080:8080 rsoares/rhel7-jboss-eap6 -c standalone-ha.xml 

```

note: if you want to change the defaul binding ports used by JBoss EAP use the `-Djboss.socket.binding.port-offset=0` where you see `x` in the `eap6_x` and `-Djboss.node.name=node_x` set your own `id` for that JBoss EAP standalone instance. The param `jboss.mod_cluster.jvmRoute=node_x` is used to identify the node name in the mod_cluster_manager console.


* to enable JBoss Clustering Subsystem tracing add the following logger categories using Admin console or jboss-cli.sh
attach to the conatiner' bash and...

```
sudo docker exec -ti eap6 /bin/bash

cd $JBOSS_HOME/bin
./jboss-cli.sh --connect --commands='/subsystem=logging/logger=org.jgroups:add(level=TRACE)','/subsystem=logging/logger=org.infinispan:add(level=TRACE)'
```

