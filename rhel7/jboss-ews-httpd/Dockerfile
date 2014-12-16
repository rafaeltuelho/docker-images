# JBoss EWS Htppd (Web Server)
# Version 1.0

# If you loaded redhat-rhel-server-7.0-x86_64 to your local registry, uncomment this FROM line instead:
# FROM registry.access.redhat.com/rhel 
# Pull the rhel image from the local repository
#FROM registry.access.redhat.com/rhel 
FROM redhat/rhel7:basic-tools 

MAINTAINER Rafael T. C. Soares <rsoares@redhat.com> 

# Update image
RUN yum update -y; \
    yum install -y unzip httpd22 httpd22-devel mod_auth_kerb-eap6 apr-util-ldap krb5-workstation elinks mod_cluster-native.x86_64; \
    yum clean all

COPY software/jboss-ews-httpd-2.1.0-RHEL7-x86_64.zip /tmp/

RUN unzip -q /tmp/jboss-ews-httpd-2.1.0-RHEL7-x86_64.zip -d /opt

RUN sed -i -e "s/Allow from 127.0.0.1/Allow from 172.17.0./" /etc/httpd22/conf.d/mod_cluster.conf;\
    sed -i -e "s/Allow from 127.0.0.1/Allow from all/" /etc/httpd22/conf.d/mod_cluster.conf;\
    sed -i -e "s/#HTTPD/HTTPD/" /etc/sysconfig/httpd22;\
    ln -s /etc/httpd22/conf.d/mod_cluster.conf /opt/jboss-ews-2.1/httpd/conf.d/mod_cluster.conf

WORKDIR /opt/jboss-ews-2.1/httpd 
RUN ./.postinstall

RUN chown -R apache:apache /opt/jboss-ews-2.1/httpd 

# Clean up
RUN rm -f /tmp/jboss*.zip

EXPOSE 80 6666

CMD ["/opt/jboss-ews-2.1/httpd/sbin/httpd","-D","FOREGROUND"]
