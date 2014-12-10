# JBoss EWS Htppd (Web Server)
# Version 1.0

# If you loaded redhat-rhel-server-7.0-x86_64 to your local registry, uncomment this FROM line instead:
# FROM registry.access.redhat.com/rhel 
# Pull the rhel image from the local repository
#FROM registry.access.redhat.com/rhel 
FROM redhat/rhel7 

MAINTAINER Rafael T. C. Soares <rsoares@redhat.com> 

# Update image
RUN yum update -y
RUN yum install -y unzip httpd22 httpd22-devel mod_auth_kerb-eap6 apr-util-ldap krb5-workstation elinks mod_cluster-native.x86_64

RUN mkdir /opt/redhat
RUN mkdir /tmp/software

ADD software/jboss-ews-httpd-2.1.0-RHEL7-x86_64.zip /tmp/software/

RUN unzip -q /tmp/software/jboss-ews-httpd-2.1.0-RHEL7-x86_64.zip -d /opt/redhat

RUN sed -i -e "s/Allow from 127.0.0.1/Allow from 172.17.42./g" /etc/httpd22/conf.d/mod_cluster.conf
RUN ln -s /etc/httpd22/conf.d/mod_cluster.conf /opt/redhat/jboss-ews-2.1/httpd/conf.d/mod_cluster.conf

#RUN groupadd -g 48 -r apache
#RUN useradd -c "Apache" -u 48 -g apache -s /bin/sh -r apache

WORKDIR /opt/redhat/jboss-ews-2.1/httpd 
RUN ./.postinstall

RUN chown -R apache:apache /opt/redhat/jboss-ews-2.1/httpd

RUN echo 0 > /proc/sys/net/ipv4/icmp_echo_ignore_broadcasts

# Clean up
RUN rm -rf /tmp/software

EXPOSE 22 80 6666

ENTRYPOINT ["/usr/sbin/httpd"] 
CMD ["-D FOREGROUND"]
