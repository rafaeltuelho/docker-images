FROM redhat/rhel7:basic-tools

MAINTAINER "Rafael T. C. Soares" <rsoares@redhat.com>

# Due a conflict with fakesystemd provided by rhel7 base image
RUN yum -y update; \
    yum -y swap -- remove fakesystemd -- install systemd systemd-libs; \
    yum -y install java-1.7.0-openjdk.x86_64 java-1.7.0-openjdk-devel.x86_64; \
    yum clean all

RUN sed -i 's/#JAVA_HOME/JAVA_HOME/' /etc/java/java.conf; source /etc/java/java.conf

ENV JAVA_HOME /usr/lib/jvm/java

CMD ["java", "-version"]
