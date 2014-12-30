FROM centos:latest

MAINTAINER "Rafael T. C. Soares" <rafaelcba@gmail.com>

RUN yum -y update; \
    yum -y install redhat-lsb-core iproute iputils net-tools nmap-ncat telnet procps-ng xterm which vim sudo unzip; \
    yum clean all

# to enable ping on multicast ip addr
RUN echo net.ipv4.icmp_echo_ignore_broadcasts=0 >> /etc/sysctl.conf

ENV TERM xterm

CMD ["/usr/bin/lsb_release", "-dcr"]
