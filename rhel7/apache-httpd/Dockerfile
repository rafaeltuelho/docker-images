FROM rsoares/rhel7:systemd-fixed4containers

MAINTAINER "Rafael T. C. Soares" <rsoares@redhat.com>

RUN yum -y update; yum -y install httpd; yum clean all; systemctl enable httpd.service

EXPOSE 80

CMD ["/usr/sbin/init"]
