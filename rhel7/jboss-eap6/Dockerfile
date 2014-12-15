FROM rsoares/rhel7:openjdk7

MAINTAINER "Rafael T. C. Soares" <rsoares@redhat.com>

RUN yum -y update; yum clean all

ADD software/jboss-eap-6.3.0.zip /tmp/software/

RUN unzip -q /tmp/software/jboss-eap-6.3.0.zip -d /opt

WORKDIR /opt/jboss-eap-6.3/bin
RUN ./add-user.sh -u admin -p jboss@eap6! -s

ENV JAVA_HOME /usr/lib/jvm/java
ENV JBOSS_HOME /opt/jboss-eap-6.3

EXPOSE 4447 8080 9990 9999

CMD ["/opt/jboss-eap-6.3/bin/standalone.sh", "-b", "0.0.0.0", "-bmanagement=0.0.0.0"]
