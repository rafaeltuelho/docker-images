* to Build

  ```sudo docker build --force-rm -t rsoares/rhel7:jboss-ews-2.1_mod_cluster ```

* to Run

  ```sudo docker run -d --privileged -p 80:80 -p 6666:6666 --name ews <username>/rhel7:jboss-ews-2.1_mod_cluster```

* to access the Container's bash

  ```sudo docker exec -ti ews /bin/bash```

* to restart the apache httpd

  ```sudo docker exec -ti ews /opt/jboss-ews-2.1/httpd/sbin/httpd -k restart```

* to get the IP addr and then

  ```sudo docker inspect --format '{{ .NetworkSettings.IPAddress }}' ews```

* to access the mod_cluster_manager

```
http://<conatiner's IP Addr>:6666/mod_cluster_manager
```

Note: some packages required by JBoss EWS are provided only by the JBoss EWS/EAP Channels. 

```
 Package                Arch   Version                 Repository          Size
================================================================================
Installing:
 apr-util-ldap          x86_64 1.5.2-6.el7             rhel-7-server-optional-rpms
                                                                           19 k
 httpd22                x86_64 2.2.26-37.ep6.el7       jb-eap-6-for-rhel-7-server-rpms
                                                                          908 k
 httpd22-devel          x86_64 2.2.26-37.ep6.el7       jb-eap-6-for-rhel-7-server-rpms
                                                                          131 k
 mod_auth_kerb-eap6     x86_64 5.4-29.ep6.el7          jb-ews-2-for-rhel-7-server-rpms
                                                                           32 k
 mod_cluster-native     x86_64 1.2.9-3.Final_redhat_2.ep6.el7
                                                       jb-eap-6-for-rhel-7-server-rpms
                                                                           83 k
 httpd22-tools          x86_64 2.2.26-37.ep6.el7       jb-eap-6-for-rhel-7-server-rpms
                                                                           62 k
--------------------------------------------------------------------------------
```


So in order to install them into the Container your RHEL 7 Host must be subscribed in that channels.

To subscribe the RHEL 7 Host use the following procedures:



