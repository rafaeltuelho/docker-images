FROM rsoares/rhel7-openjdk:7

MAINTAINER "Rafael T. C. Soares" <rsoares@redhat.com>

RUN yum -y update; \
    yum clean all

COPY software/jboss-eap-6.3.0.zip /tmp/software/
COPY software/patch/*.zip /tmp/software/patch/
COPY support/*.sh /

RUN unzip -q /tmp/software/jboss-eap-6.3.0.zip -d /opt

WORKDIR /opt/jboss-eap-6.3/bin

RUN ./add-user.sh -u admin -p jboss@eap6! -s
RUN . /applyPatch.sh 

ENV JAVA_HOME /usr/lib/jvm/java
ENV JBOSS_HOME /opt/jboss-eap-6.3

EXPOSE 4447 8080 9990 9999

ENTRYPOINT ["/init.sh"]
