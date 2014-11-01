FROM dballinger/tomcat7
MAINTAINER Darren Ballinger <djb@braxis-ltd.com>

ADD target/docker-web.war ${CATALINA_HOME}/webapps/docker-web.war

CMD ["/run.sh"]