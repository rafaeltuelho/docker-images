* to Build
...sudo docker build --force-rm -t rsoares/rhel7:jboss-eap6 . 
* to Run
...sudo docker run -ti --name eap6 <username>/rhel7:jboss-eap6

* to access the Container's bash
...sudo docker exec -ti eap6 bash

* to get the IP addr and then
...sudo docker inspect --format '{{ .NetworkSettings.IPAddress }}' eap6

* to access the EAP Admin Console
...http://<conatiner's IP Addr>:9990/console
... ...user: admin
... ...pwd: jboss@eap6!
