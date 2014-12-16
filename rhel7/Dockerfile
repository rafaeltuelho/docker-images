FROM registry.access.redhat.com/rhel:latest

MAINTAINER "Rafael T. C. Soares" <rsoares@redhat.com>

RUN yum -y update; \
    yum -y install iproute iputils net-tools nmap-ncat telnet procps-ng xterm which vim sudo unzip; \
    yum clean all

# to enable ping on multicast ip addr
echo net.ipv4.icmp_echo_ignore_broadcasts=0 >> /etc/sysctl.conf
RUN sysctl -p

ENV TERM xterm

CMD ["lsb_release", "-dcr"]
