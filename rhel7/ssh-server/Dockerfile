FROM redhat/rhel7-basic-tools

MAINTAINER "Rafael T. C. Soares" <rsoares@redhat.com>

RUN yum -y update; \
    yum -y install openssh openssh-server openssh-clients; \
    yum clean all

RUN /bin/ssh-keygen -t ecdsa -f /etc/ssh/ssh_host_ecdsa_key -N ""; \
    /bin/ssh-keygen -t rsa -f /etc/ssh/ssh_host_rsa_key -N ""; \ 
    mkdir /var/run/sshd; 

RUN /usr/sbin/sshd

RUN echo 'root:choose@pwd' | chpasswd; \
    sed -i.bak 's/#PermitRootLogin/PermitRootLogin/' /etc/ssh/sshd_config

EXPOSE 22

CMD ["/usr/sbin/sshd", "-D"]

