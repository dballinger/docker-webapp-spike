FROM tifayuki/java:7
MAINTAINER Darren Ballinger <djb@braxis-ltd.com>

RUN apt-get update && \
    sudo apt-get install -y software-properties-common python-software-properties && \
    apt-get install -yq --no-install-recommends wget pwgen ca-certificates && \
    apt-get install -y openjdk-7-jdk && \
    add-apt-repository -y ppa:nginx/stable && \
    apt-get update && \
#apt-get install -y tomcat7 && \
    apt-get install -y nginx && \
    apt-get install -y nano && \
    apt-get install -y curl && \
    rm -rf /var/lib/apt/lists/*

ENV TOMCAT_MAJOR_VERSION 7
ENV TOMCAT_MINOR_VERSION 7.0.55
ENV CATALINA_HOME /tomcat

# INSTALL TOMCAT
RUN wget -q https://archive.apache.org/dist/tomcat/tomcat-${TOMCAT_MAJOR_VERSION}/v${TOMCAT_MINOR_VERSION}/bin/apache-tomcat-${TOMCAT_MINOR_VERSION}.tar.gz && \
    wget -qO- https://archive.apache.org/dist/tomcat/tomcat-${TOMCAT_MAJOR_VERSION}/v${TOMCAT_MINOR_VERSION}/bin/apache-tomcat-${TOMCAT_MINOR_VERSION}.tar.gz.md5 | md5sum -c - && \
    tar zxf apache-tomcat-*.tar.gz && \
    rm apache-tomcat-*.tar.gz && \
    mv apache-tomcat* tomcat

ADD create_tomcat_admin_user.sh /create_tomcat_admin_user.sh
ADD run.sh /run.sh
ADD index.html /usr/share/nginx/html/index.html
ADD nginx.conf /etc/nginx/nginx.conf
RUN chmod +x /*.sh

EXPOSE 8080
EXPOSE 80
#CMD ["/run.sh"]